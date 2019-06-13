from django.urls import path, re_path
from django.conf.urls import url
from django.views.generic import TemplateView
from django.views.decorators.cache import cache_page

# from .views import CourseListView, CourseDetailView, CourseInfoView, CommentsView, AddCommentsView, VideoPlayView
from .views import CourseListView, CourseInfoView, VideoPlayView, CommentsView, AddCommentsView, CourseLearnView, NotesView, AddNotesView, WikiView

app_name = "courses"

urlpatterns = [
    # 课程列表页
    path('list/', CourseListView.as_view(), name="course_list"),
    re_path('info/(?P<course_id>\d+)/', CourseInfoView.as_view(), name="course_info"),
    re_path('video/(?P<video_id>\d+)/', VideoPlayView.as_view(), name="video_play"),
    # 课程评论
    re_path('comments/(?P<course_id>\d+)/', CommentsView.as_view(), name="course_comments"),
    # 课程wiki
    re_path('wiki/(?P<course_id>\d+)/', WikiView.as_view(), name="course_wiki"),
    # 添加课程评论,已经把参数放到post当中了
    path('add_comment/', AddCommentsView.as_view(), name="add_comment"),
    re_path('learn/(?P<course_id>\d+)/', CourseLearnView.as_view(), name="course_learn"),
    re_path('note/(?P<video_id>\d+)/', NotesView.as_view(), name="course_note"),
    path('add_note/', AddNotesView.as_view(), name="add_note")
]