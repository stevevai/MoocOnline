'''
from django.core.mail import send_mail
from MoocOnline.settings import EMAIL_FROM

import os
import django

from celery import Celery
from django.conf import settings

os.environ.setdefault('DJANGO_SETTINGS_MODULE', 'MoocOnline.settings')
django.setup()

# 创建celery对象,broker中间人,在IP地址后指定使用哪个数据库
app = Celery('celery_tasks.tasks', broker='redis://127.0.0.1:6379/8')


# 定义任务函数
@app.task
def send_register_active_email(email, username, token):

    email_title = "慕课在线注册激活"
    email_content = ""
    html_message = '<h1>%s，欢迎您成为慕课在线注册会员</h1>' \
                   '请点击下面的链接激活您的账号: </br><a href="http://127.0.0.1:8000/active/%s">' \
                   'http://127.0.0.1:8000/active/%s</a>' \
                   ' ，链接将在30分钟后失效' % (username, token, token)

    # 使用Django内置函数来发送邮件
    send_mail(email_title, email_content, EMAIL_FROM, [email], html_message=html_message)
'''