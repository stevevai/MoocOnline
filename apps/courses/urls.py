from django.urls import path, re_path
from django.conf.urls import url
from django.views.generic import TemplateView

# from .views import CourseListView, CourseDetailView, CourseInfoView, CommentsView, AddCommentsView, VideoPlayView
from .views import CourseListView, CourseInfoView

app_name = "courses"

urlpatterns = [
    # 课程列表页
    path('list/', CourseListView.as_view(), name="course_list"),
    re_path('info/(?P<course_id>\d+)/', CourseInfoView.as_view(), name="course_info")
]