from django.shortcuts import render
from django.contrib.auth import authenticate, login, logout
from django.contrib.auth.backends import ModelBackend
from django.db.models import Q  # 并集运算
from django.views.generic.base import View
from django.contrib.auth.hashers import make_password
from django.http import HttpResponseRedirect, HttpResponse
from django.urls import reverse
from django.contrib.auth.mixins import LoginRequiredMixin

from .models import UserProfile, EmailVerifyRecord
from courses.models import Course
from teachers.models import Teacher
from operation.models import UserFavourite, UserCourse, Banner
from .forms import LoginForm, RegisterForm, UserInfoForm, UploadImageForm, ModifyPwdForm
from MoocOnline.settings import SECRET_KEY
from util.email_send import send_update_email
from .tasks import send_register_active_email
# from celery_tasks.tasks import send_register_active_email

from itsdangerous import TimedJSONWebSignatureSerializer as Serializer
from itsdangerous import SignatureExpired
import json
from django.core.cache import cache
# Create your views here.


class CustomBacked(ModelBackend):
    def authenticate(self, request, username=None, password=None, **kwargs):
        try:
            # 取并集，get只能返回一个对象
            user = UserProfile.objects.get(Q(username=username) | Q(email=username))

            # django的后台中密码加密：所以不能password==password
            # UserProfile继承的AbstractUser中有def check_password(self, raw_password):
            if user.check_password(password):
                return user
        except Exception as e:
            return None


# 登录
class LoginView(View):
    def get(self, request):
        return render(request, "login.html", {})

    def post(self, request):
        # 表单验证
        login_form = LoginForm(request.POST)
        if login_form.is_valid():
            user_name = request.POST.get("username", "")
            pass_word = request.POST.get("password", "")

            # 登录校验
            user = authenticate(username=user_name, password=pass_word)

            # 用户名和密码正确
            if user is not None:
                # 检查是否激活
                if user.is_active:
                    # 记录用户的登录状态
                    login(request, user)
                    # 跳转回首页
                    return HttpResponseRedirect(reverse("index"))
                else:
                    return render(request, "login.html", {"msg": "用户未激活"})
            # 输入的密码不正确，跳转回登录页面
            else:
                return render(request, "login.html", {"msg": "用户名或密码错误"})
        else:
            return render(request, "login.html", {"login_form": login_form})


# 登出
class LogoutView(View):
    def get(self, request):
        # django自带的logout
        logout(request)
        # 重定向到首页,
        return HttpResponseRedirect(reverse("index"))


# 编写注册View
class RegisterView(View):
    def get(self,request):
        # 添加验证码
        register_form = RegisterForm()
        return render(request, "register.html", {'register_form': register_form})
        pass

    def post(self,request):
        # 实例化form
        register_form = RegisterForm(request.POST)
        if register_form.is_valid():
            user_name = request.POST.get("username", "")
            if UserProfile.objects.filter(username=user_name):
                return render(request, "register.html", {"register_form": register_form, "msg": "该用户名已被占用"})
            email = request.POST.get("email", "")
            if UserProfile.objects.filter(email=email):
                return render(request, "register.html", {"register_form": register_form, "msg": "该邮箱已经被注册"})
            pass_word = request.POST.get("password", "")

            # 实例化一个user对象，并存入数据库中
            user_profile = UserProfile()
            user_profile.username = user_name
            user_profile.email = email
            user_profile.is_active = False  # 用户邮箱仍未激活
            # 加密password
            user_profile.password = make_password(pass_word)
            # 保存到数据库中
            user_profile.save()

            # 发送激活邮件，包含激活链接：127.0.0.1/user/active/3（传入一个user id）
            # 激活链接中需要包含用户的身份信息，并且把身份信息进行加密

            # 加密用户信息，并生成激活的token
            # 密钥使用了Django提供的，30分钟过期
            serializer = Serializer(SECRET_KEY, 1800)
            info = {'confirm': user_profile.id}
            token = serializer.dumps(info)  # bytes
            token = token.decode('utf8')

            # 发送邮件
            # send_register_active_email(email, user_name, token)
            send_register_active_email.delay(email, user_name, token)  # 异步发送邮件

            # 邮件发送成功
            return render(request, "send_success.html")
        else:
            return render(request, "register.html", {"register_form": register_form})


# 激活的View
class ActiveUserView(View):
    def get(self, request, token):
        # 解密
        serializer = Serializer(SECRET_KEY, 1800)
        try:
            info = serializer.loads(token)
            user_id = info['confirm']
            # 获取用户信息
            user = UserProfile.objects.get(id=user_id)
            user.is_active = True
            user.save()

            # 跳转到登录页面
            active_success_msg = "激活成功"
            return render(request, "login.html", {"active_success_msg": active_success_msg})

        except SignatureExpired as e:
            # 激活链接已过期
            return HttpResponse('激活链接已过期')


# 首页view
class IndexView(View):

    def get(self, request):
        # 取出轮播图
        # all_banner = Banner.objects.all().order_by('index')[:3]
        '''
        引入缓存
        '''

        # 设置key
        course_key = 'course'
        new_course_key = 'new_course'

        # 判断key是否存在cache中，存在则在cache中取，不存在则查询数据库
        if course_key in cache:
            courses = cache.get(course_key)
        else:
            # 热门课程
            courses = Course.objects.all().order_by('-stu_nums')[:5]
            cache.set(course_key, courses, 24*60*60)

        if new_course_key in cache:
            new_courses = cache.get(new_course_key)
        else:
            # 新上好课
            new_courses = Course.objects.all().order_by('-add_time')[:10]
            cache.set(new_course_key, new_courses, 24 * 60 * 60)

        return render(request, 'index.html', {
            # "all_banner": all_banner,
            "courses": courses,
            "new_courses": new_courses
        })


# 推荐View
class RecommendView(LoginRequiredMixin, View):
    login_url = '/login/'
    redirect_field_name = 'next'

    def get(self, request):
        # 取出轮播图
        all_banner = Banner.objects.all().order_by('index')[:3]
        # 猜你喜欢
        # courses = Course.objects.all().order_by('-stu_nums')[:5]
        # 查询用户学习过的课程
        user_courses = UserCourse.objects.filter(user=request.user)
        # 如果已经有学习记录
        if user_courses:
            course_ids = [user_course.course_id for user_course in user_courses]
            all_user_courses = Course.objects.filter(id__in=course_ids)
            # 提取一级分类
            course_tags = [course.classify_root_id for course in all_user_courses]
            # course_tags = [course.tags.name for course in all_user_courses]

            recommend_courses = Course.objects.filter(classify_root_id__in=course_tags)
            # 不要推荐用户已经学过的课程
            recommend_courses = recommend_courses.exclude(id__in=course_ids)
            # 随机选5个
            if recommend_courses.count() > 5:
                recommend_courses = recommend_courses.order_by('?')[:5]

        # 如果是新用户
        else:
            recommend_courses = Course.objects.all().order_by("-stu_nums").order_by('?')[:5]

        # 优质课程
        good_courses = Course.objects.all().order_by('-fav_nums')[:5]

        return render(request, 'discovery.html', {
            "all_banner": all_banner,
            "courses": recommend_courses,
            "new_courses": good_courses
        })


# 用户个人信息view
class UserInfoView(LoginRequiredMixin, View):
    login_url = '/login/'
    redirect_field_name = 'next'

    def get(self, request):
        return render(request, "usercenter-info.html", {
        })

    def post(self, request):
        user_info_form = UserInfoForm(request.POST, instance=request.user)
        if user_info_form.is_valid():
            user_info_form.save()
            return render(request, "usercenter-info.html", {})
        else:
            # 返回错误信息,json.dumps
            return HttpResponse(json.dumps(user_info_form.errors), content_type='application/json')


# 用户上传图片的view:用于修改头像
class UploadImageView(LoginRequiredMixin, View):
    login_url = '/login/'
    redirect_field_name = 'next'

    def post(self, request):
        # 这时候用户上传的文件就已经被保存到imageform了
        # 不指定当前用户的话，系统会创建一个新用户
        image_form = UploadImageForm(request.POST, request.FILES, instance=request.user)
        if image_form.is_valid():
            image_form.save()

            return HttpResponse('{"status":"success"}', content_type='application/json')
        else:
            return HttpResponse('{"status":"fail"}', content_type='application/json')


# 在个人中心修改用户密码
class UpdatePwdView(View):
    def post(self, request):
        modiypwd_form = ModifyPwdForm(request.POST)
        if modiypwd_form.is_valid():
            pwd1 = request.POST.get("password1", "")
            pwd2 = request.POST.get("password2", "")
            # 如果两次密码不相等，返回错误信息
            if pwd1 != pwd2:
                return HttpResponse('{"status":"fail", "msg":"密码不一致"}', content_type='application/json')
            # 如果密码一致
            user = request.user
            # 加密成密文
            user.password = make_password(pwd2)
            # save保存到数据库
            user.save()
            return HttpResponse('{"status":"success"}', content_type='application/json')
        # 验证失败说明密码位数不够。
        else:
            return HttpResponse('{"status":"fail", "msg":"填写错误请检查"}', content_type='application/json')


class SendEmailCodeView(LoginRequiredMixin, View):
    '''
    发送邮箱验证码
    '''
    def get(self, request):
        # new email
        email = request.GET.get("email", "")

        # 不能是已注册的邮箱
        if UserProfile.objects.filter(email=email):
            return HttpResponse('{"email":"邮箱已经存在"}', content_type='application/json')
        send_update_email(email)
        return HttpResponse('{"status":"success"}', content_type='application/json')


# 修改邮箱的view:
class UpdateEmailView(LoginRequiredMixin, View):
    login_url = '/login/'
    redirect_field_name = 'next'

    def post(self, request):
        email = request.POST.get("email", "")
        code = request.POST.get("code", "")

        existed_records = EmailVerifyRecord.objects.filter(email=email, code=code, send_type='update_email')
        if existed_records:
            user = request.user
            user.email = email
            user.save()
            return HttpResponse('{"status":"success"}', content_type='application/json')
        else:
            return HttpResponse('{"email":"验证码无效"}', content_type='application/json')


class AddFavView(View):
    """
        用户收藏，用户取消收藏
        """

    def post(self, request):
        fav_id = request.POST.get('fav_id', 0)
        fav_type = request.POST.get('fav_type', 0)

        if not request.user.is_authenticated:
            # 判断用户登录状态
            return HttpResponse('{"status":"fail", "msg":"用户未登录"}', content_type='application/json')

        exist_records = UserFavourite.objects.filter(user=request.user, fav_id=int(fav_id), fav_type=int(fav_type))
        if exist_records:
            # 如果记录已经存在， 则表示用户取消收藏
            exist_records.delete()
            if int(fav_type) == 1:
                course = Course.objects.get(id=int(fav_id))
                course.fav_nums -= 1
                if course.fav_nums < 0:
                    course.fav_nums = 0
                course.save()

            elif int(fav_type) == 2:
                teacher = Teacher.objects.get(id=int(fav_id))
                teacher.fav_nums -= 1
                if teacher.fav_nums < 0:
                    teacher.fav_nums = 0
                teacher.save()
            return HttpResponse('{"status":"success", "msg":"收藏"}', content_type='application/json')
        else:
            user_fav = UserFavourite()
            if int(fav_id) > 0 and int(fav_type) > 0:
                user_fav.user = request.user
                user_fav.fav_id = int(fav_id)
                user_fav.fav_type = int(fav_type)
                user_fav.save()

                if int(fav_type) == 1:
                    course = Course.objects.get(id=int(fav_id))
                    course.fav_nums += 1
                    course.save()

                elif int(fav_type) == 2:
                    teacher = Teacher.objects.get(id=int(fav_id))
                    teacher.fav_nums += 1
                    teacher.save()

                return HttpResponse('{"status":"success", "msg":"已收藏"}', content_type='application/json')
            else:
                return HttpResponse('{"status":"fail", "msg":"收藏出错"}', content_type='application/json')


# 个人中心页我的课程
class MyCourseView(LoginRequiredMixin, View):
    login_url = '/login/'
    redirect_field_name = 'next'

    def get(self, request):
        user_courses = UserCourse.objects.filter(user=request.user)
        return render(request, "usercenter-mycourse.html", {
            "user_courses": user_courses,
        })


# 我收藏的授课讲师
class MyFavTeacherView(LoginRequiredMixin, View):
    login_url = '/login/'
    redirect_field_name = 'next'

    def get(self, request):
        teacher_list = []
        fav_teachers = UserFavourite.objects.filter(user=request.user, fav_type=2)
        # 上面的fav_teachers只是存放了id。我们还需要通过id找到讲师对象
        for fav_teacher in fav_teachers:
            # 取出fav_id也就是机构的id。
            teacher_id = fav_teacher.fav_id
            # 获取这个教师对象
            teacher = Teacher.objects.get(id=teacher_id)
            teacher_list.append(teacher)
        return render(request, "usercenter-fav-teacher.html", {
            "teacher_list": teacher_list,
        })


# 我收藏的课程

class MyFavCourseView(LoginRequiredMixin, View):
    login_url = '/login/'
    redirect_field_name = 'next'

    def get(self, request):
        course_list = []
        fav_courses = UserFavourite.objects.filter(user=request.user, fav_type=1)
        # 上面的fav_courses只是存放了id。我们还需要通过id找到机构对象
        for fav_course in fav_courses:
            # 取出fav_id也就是课程的id。
            course_id = fav_course.fav_id
            # 获取这个机构对象
            course = Course.objects.get(id=course_id)
            course_list.append(course)
        return render(request, "usercenter-fav-course.html", {
            "course_list": course_list,
        })
