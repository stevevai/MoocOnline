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

import xadmin

from users.views import LoginView, RegisterView, ActiveUserView

urlpatterns = [
    path('xadmin/', xadmin.site.urls),
    path('', TemplateView.as_view(template_name="index.html"), name="index"),
    path('login/', LoginView.as_view(), name="login"),
    path('register/', RegisterView.as_view(), name="register"),
    path('send_success/', TemplateView.as_view(template_name="send_success.html"), name="send_success"),
    # 激活账号
    re_path("active/(?P<token>.*)/", ActiveUserView.as_view(), name="user_active"),
    # 验证码
    path("captcha/", include('captcha.urls')),
]
