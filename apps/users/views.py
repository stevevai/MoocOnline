from django.shortcuts import render
from django.contrib.auth import authenticate, login, logout
from django.contrib.auth.backends import ModelBackend
from django.db.models import Q  # 并集运算
from django.views.generic.base import View
from django.contrib.auth.hashers import make_password
from django.http import HttpResponseRedirect, HttpResponse
from django.urls import reverse
from django.contrib.auth.mixins import LoginRequiredMixin

from .models import UserProfile
from .forms import LoginForm, RegisterForm
from MoocOnline.settings import SECRET_KEY
from util.email_send import send_register_email
from celery_tasks.tasks import send_register_active_email

from itsdangerous import TimedJSONWebSignatureSerializer as Serializer
from itsdangerous import SignatureExpired
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

            # 成功则返回user对象，否则返回null
            user = authenticate(username=user_name, password=pass_word)

            # 如果不是null说明验证成功
            if user is not None:
                if user.is_active:
                    login(request, user)
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
            # send_register_email(email, token, "register")
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