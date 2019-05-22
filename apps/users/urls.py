# from .views import UserInfoView, UploadImageView, UpdatePwdView, SendEmailCodeView, UpdateEmailView, MyCourseView, MyFavTeacherView, MyFavCourseView


from django.urls import path
from django.views.generic import TemplateView
from .views import UserInfoView, UploadImageView, UpdatePwdView, SendEmailCodeView, UpdateEmailView, AddFavView


app_name = "users"

urlpatterns = [
    # 用户信息
    path('info/', UserInfoView.as_view(), name="user_info"),
    # 用户头像上传
    path('image/upload/', UploadImageView.as_view(), name="image_upload"),
    # 修改密码
    path('update/pwd/', UpdatePwdView.as_view(), name="update_pwd"),
    # 发送邮箱验证码
    path('sendemail_code/', SendEmailCodeView.as_view(), name="sendemail_code"),
    path('update_email/', UpdateEmailView.as_view(), name="update_email"),
    path('add_fav/', AddFavView.as_view(), name="add_fav")
]