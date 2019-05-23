from django.shortcuts import render
from django.views.generic.base import View
from django.contrib.auth.mixins import LoginRequiredMixin
from django.http import HttpResponse, HttpResponseRedirect
from django.urls import reverse

from .models import Course, CourseClassify, CourseClassify2, CourseResources, Video, Lesson
from operation.models import CourseComments, UserFavourite, UserCourse

from pure_pagination import Paginator, EmptyPage, PageNotAnInteger
# Create your views here.


class CourseListView(View):
    def get(self, request):
        # 获取全部分类
        classify = CourseClassify.objects.all()
        classify2 = CourseClassify2.objects.all()

        # 默认按更新时间排序
        all_courses = Course.objects.all().order_by("-add_time")

        # 课程全局搜索功能
        '''
        search_keywords = request.GET.get('keywords', '')
        if search_keywords:
            # 在name字段进行操作,做like语句的操作。i代表不区分大小写
            all_courses = all_courses.filter(
                Q(name__icontains=search_keywords) | Q(desc__icontains=search_keywords) | Q(
                    detail__icontains=search_keywords))
        '''

        # 进行排序，分为最新和最热，默认是最新
        sort = request.GET.get('sort', "")
        if sort:
            if sort == "pop":
                all_courses = all_courses.order_by("-stu_nums")
            elif sort == "last":
                all_courses = all_courses.order_by("-add_time")

        # 课程分类
        c1 = request.GET.get('c1', "")
        if c1:
            all_courses = all_courses.filter(classify_root__name=c1)

        # 二级分类
        c2 = request.GET.get('c2', "")
        if c2:
            all_courses = all_courses.filter(classify_detail__name=c2)

        # 根据degree来筛选
        is_easy = request.GET.get('is_easy', "")
        if is_easy:
            if is_easy == "1":
                all_courses = all_courses.filter(degree="cj")
            elif is_easy == "2":
                all_courses = all_courses.filter(degree="zj")
            elif is_easy == "3":
                all_courses = all_courses.filter(degree="gj")

        # 对课程进行分页
        # 尝试获取前台get请求传递过来的page参数
        # 如果是不合法的配置参数默认返回第一页
        try:
            page = request.GET.get('page', 1)
            current_page = page
        except PageNotAnInteger:
            page = 1
        # 每页显示10个
        p = Paginator(all_courses, 10, request=request)
        courses = p.page(page)

        # 计算总页数
        if all_courses.count() == 0:
            page_nums = 0
            current_page = 0
        else:
            page_nums = int((all_courses.count() / 10)) + 1

        return render(request, "course-list.html", {"all_courses": courses, "page_nums": page_nums,
                                                    "current_page": current_page, "classify": classify,
                                                    "classify2": classify2, "sort": sort, "c1": c1, "c2": c2,
                                                    "is_easy": is_easy})
        # return render(request, "course-list.html", {"all_courses": courses, "sort": sort, "hot_courses": hot_courses,
        #                                           "search_keywords": search_keywords})


# 处理课程章节信息页面的view
class CourseInfoView(LoginRequiredMixin, View):
    def get(self, request, course_id):
        # 此处的id为表默认为我们添加的值。
        course = Course.objects.get(id=int(course_id))

        '''
        course.students += 1
        course.save()
        '''

        # 查询用户是否关联了该门课程
        have_learn = False

        user_courses = UserCourse.objects.filter(user=request.user, course=course)
        progress = ""
        if user_courses:
            have_learn = True
            # 找出最新的一条学习记录
            user_courses = UserCourse.objects.filter(user=request.user, course=course).order_by("-add_time")[0:1].get()
            progress = user_courses.section.name

        else:
            progress = "尚未学习本课程"

        '''
        # 选出学了这门课的学生关系
        user_courses = UserCourse.objects.filter(course=course)
        # 从关系中取出user_id
        user_ids = [user_course.user_id for user_course in user_courses]
        # 这些用户学了的课程,外键会自动有id，取到字段,两个下划线代表我传进来的是一个list
        all_user_courses = UserCourse.objects.filter(user_id__in=user_ids)
        # 取出所有课程id
        course_ids = [all_user_course.course_id for all_user_course in all_user_courses]
        # 获取学过该课程用户学过的其他课程
        relate_courses = Course.objects.filter(id__in=course_ids).order_by("-click_nums")[:5]
        '''
        # 收藏
        have_fav_course = False
        have_fav_teacher = False

        # 判断是否已登录
        if request.user.is_authenticated:
            if UserFavourite.objects.filter(user=request.user, fav_id=course.id, fav_type=1):
                have_fav_course = True
            if UserFavourite.objects.filter(user=request.user, fav_id=course.teacher.id, fav_type=2):
                have_fav_teacher = True

        all_resources = CourseResources.objects.filter(course=course)

        return render(request, "course-info.html", {
            "course": course,
            "course_resources": all_resources,
            "have_fav_course": have_fav_course,
            "have_fav_teacher": have_fav_teacher,
            "have_learn": have_learn,
            "progress": progress
        })


# 播放视频的view
class VideoPlayView(LoginRequiredMixin, View):
    login_url = '/login/'
    redirect_field_name = 'next'

    def get(self, request, video_id):
        # 此处的id为表默认为我们添加的值。
        video = Video.objects.get(id=int(video_id))

        # 查询对应的course
        course = video.lesson.course

        '''
        记录学习状态
        '''
        user_courses = UserCourse.objects.filter(user=request.user, course=course)
        # 尚未点击开始学习，则不记录学习状态
        if not user_courses:
            pass
        else:
            user_courses = UserCourse(user=request.user, course=course, section=video)
            user_courses.save()

        # 查询课程资源
        all_resources = CourseResources.objects.filter(course=course)
        # 只显示当前章节下的评论
        all_comments = CourseComments.objects.filter(video=video).order_by("-add_time")

        return render(request, "course-video.html", {
            "course": course,
            "all_resources": all_resources,
            "video": video,
            "all_comments": all_comments,
        })


# 课程全部评论
class CommentsView(LoginRequiredMixin, View):
    login_url = '/login/'
    redirect_field_name = 'next'

    def get(self, request, course_id):
        course = Course.objects.get(id=int(course_id))

        all_resources = CourseResources.objects.filter(course=course)
        all_comments = CourseComments.objects.all()
        return render(request, "course-comment.html", {
            "course": course,
            "course_resources": all_resources,
            "all_comments": all_comments,
        })


# ajax方式添加评论
class AddCommentsView(View):
    def post(self, request):
        if not request.user.is_authenticated:
            # 未登录时返回json提示未登录，跳转到登录页面是在ajax中做的
            return HttpResponse('{"status":"fail", "msg":"用户未登录"}', content_type='application/json')
        course_id = request.POST.get("course_id", 0)
        video_id = request.POST.get("video_id", 0)
        comments = request.POST.get("comments", "")
        if int(course_id) > 0 and comments:
            course_comments = CourseComments()
            # get只能取出一条数据，如果有多条抛出异常。没有数据也抛异常
            # filter取一个列表出来，queryset。没有数据返回空的queryset不会抛异常
            course = Course.objects.get(id=int(course_id))
            video = Video.objects.get(id=int(video_id))
            # 外键存入要存入对象
            course_comments.course = course
            course_comments.comments = comments
            course_comments.video = video
            course_comments.user = request.user
            course_comments.save()
            return HttpResponse('{"status":"success", "msg":"评论成功"}', content_type='application/json')
        else:
            return HttpResponse('{"status":"fail", "msg":"评论失败"}', content_type='application/json')


class CourseLearnView(LoginRequiredMixin, View):
    login_url = '/login/'
    redirect_field_name = 'next'

    def get(self, request, course_id):
        course = Course.objects.get(id=int(course_id))
        video_id = 0

        user_courses = UserCourse.objects.filter(user=request.user, course=course)

        # 开始学习
        if not user_courses:
            lesson = Lesson.objects.filter(course=course).first()
            video = Video.objects.filter(lesson=lesson).first()
            user_courses = UserCourse(user=request.user, course=course, section=video)
            user_courses.save()
            course.stu_nums += 1
            course.save()
            # 跳转第一个视频
            video_id = video.id
            return HttpResponseRedirect('/course/video/%s/' % video_id)

        # 继续学习
        else:
            # 找出最新的一条学习记录
            user_courses = UserCourse.objects.filter(user=request.user, course=course).order_by("-add_time")[0:1].get()
            video_id = user_courses.section.id
            return HttpResponseRedirect('/course/video/%s/' % video_id)


