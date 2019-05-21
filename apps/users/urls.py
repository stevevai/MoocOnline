# from .views import UserInfoView, UploadImageView, UpdatePwdView, SendEmailCodeView, UpdateEmailView, MyCourseView, MyFavTeacherView, MyFavCourseView


from django.urls import path
from django.views.generic import TemplateView
from .views import UserInfoView


app_name = "users"

urlpatterns = [
    # 用户信息
    path('info/', UserInfoView.as_view(), name="user_info")
]