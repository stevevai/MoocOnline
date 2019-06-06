"""MoocOnline URL Configuration

The `urlpatterns` list routes URLs to views. For more information please see:
    https://docs.djangoproject.com/en/2.2/topics/http/urls/
Examples:
Function views
    1. Add an import:  from my_app import views
    2. Add a URL to urlpatterns:  path('', views.home, name='home')
Class-based views
    1. Add an import:  from other_app.views import Home
    2. Add a URL to urlpatterns:  path('', Home.as_view(), name='home')
Including another URLconf
    1. Import the include() function: from django.urls import include, path
    2. Add a URL to urlpatterns:  path('blog/', include('blog.urls'))
"""
from django.contrib import admin
from django.urls import path, re_path
from django.views.generic import TemplateView
from django.conf.urls import include
from django.views.static import serve
from django.conf.urls.static import static

import xadmin

from users.views import LoginView, RegisterView, ActiveUserView, LogoutView, IndexView
from .settings import MEDIA_ROOT, MEDIA_URL

urlpatterns = [
    path('xadmin/', xadmin.site.urls),
    path('', IndexView.as_view(), name="index"),
    path('login/', LoginView.as_view(), name="login"),
    path('logout/', LogoutView.as_view(), name="logout"),
    path('register/', RegisterView.as_view(), name="register"),
    path('send_success/', TemplateView.as_view(template_name="send_success.html"), name="send_success"),
    # 激活账号
    re_path("active/(?P<token>.*)/", ActiveUserView.as_view(), name="user_active"),
    # 验证码
    path("captcha/", include('captcha.urls')),
    # 富文本编辑器
    path('ueditor/', include('DjangoUeditor.urls')),
    path('ckeditor/', include('ckeditor_uploader.urls')),
    # 课程相关
    path("course/", include('courses.urls', namespace="course")),
    # 配置文件上传的url,serve到某个路径下去找
    re_path(r'^media/(?P<path>.*)', serve, {"document_root": MEDIA_ROOT}),
    path("users/", include('users.urls', namespace="users")),
    path('article/', include('article.urls', namespace='article')),
    path("search/", include('haystack.urls')),
    path("mdeditor/", include('mdeditor.urls'))
] + static(MEDIA_URL, document_root=MEDIA_ROOT)     # 没有这一句无法显示上传的图片
