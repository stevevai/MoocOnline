from django.urls import path, re_path
from django.conf.urls import url
from django.views.generic import TemplateView

# from .views import CourseListView, CourseDetailView, CourseInfoView, CommentsView, AddCommentsView, VideoPlayView
from .views import CourseListView

app_name = "courses"

urlpatterns = [
    # 课程列表页
    path('list/', TemplateView.as_view(template_name="freecourse.html"), name="course_list")
]