from django.shortcuts import render
from django.views.generic.base import View

from .models import Course, CourseClassify, CourseClassify2

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
