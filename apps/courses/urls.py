from django.urls import path, re_path
from django.conf.urls import url

# from .views import CourseListView, CourseDetailView, CourseInfoView, CommentsView, AddCommentsView, VideoPlayView

app_name = "courses"

urlpatterns = [
    # 课程列表页
    path('list/', CourseListView.as_view(), name="course_list"),
    '''
    re_path('detail/(?P<course_id>\d+)/', CourseDetailView.as_view(), name="course_detail"),
    re_path('info/(?P<course_id>\d+)/', CourseInfoView.as_view(), name="course_info"),
    re_path('comments/(?P<course_id>\d+)/', CommentsView.as_view(), name="course_comments"),
    path('add_comment/', AddCommentsView.as_view(), name="add_comment"),
    url(r'^video/(?P<video_id>\d+)/$', VideoPlayView.as_view(), name="video_play"),
    '''
]