# from .views import UserInfoView, UploadImageView, UpdatePwdView, SendEmailCodeView, UpdateEmailView, MyCourseView, MyFavTeacherView, MyFavCourseView


from django.urls import path
from django.views.generic import TemplateView


app_name = "users"

urlpatterns = [
    # 用户信息
    path('info/', TemplateView.as_view(template_name="usercenter-info.html"), name="user_info")
]