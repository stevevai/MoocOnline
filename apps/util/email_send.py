from django.core.mail import send_mail

import random

from users.models import EmailVerifyRecord
from MoocOnline.settings import EMAIL_FROM


# 生成随机字符串,默认长度为8
def random_str(random_length=8):
    str = ''
    # 生成字符串的可选字符串
    chars = 'AaBbCcDdEeFfGgHhIiJjKkLlMmNnOoPpQqRrSsTtUuVvWwXxYyZz0123456789'
    length = len(chars) - 1
    for i in range(random_length):
        str += chars[random.randint(0, length)]
    return str


def send_register_active_email(email, username, token):

    email_title = "MOOC Online注册激活"
    email_content = ""
    html_message = '<h1>%s，欢迎您成为MOOC Online注册会员</h1>' \
                   '请点击下面的链接激活您的账号: </br><a href="http://127.0.0.1:8000/active/%s">' \
                   'http://127.0.0.1:8000/active/%s</a>' \
                   ' ，链接将在30分钟后失效' % (username, token, token)

    # 使用Django内置函数来发送邮件
    send_mail(email_title, email_content, EMAIL_FROM, [email], html_message=html_message)


def send_register_email(email, token, send_type="register"):
    # email_record = EmailVerifyRecord()
    code = random_str(16)

    # 定义邮件内容
    email_title = ""
    email_content = ""
    html_message = ""

    if send_type == "register":
        email_title = "慕课在线注册激活"
        html_message = '<h1>欢迎您成为慕课在线注册会员</h1>' \
                       '请点击下面的链接激活您的账号: </br><a href="http://127.0.0.1:8000/active/%s">' \
                       'http://127.0.0.1:8000/active/%s</a>' \
                       ' ，链接将在30分钟后失效' % (token, token)

        # 使用Django内置函数来发送邮件
        send_status = send_mail(email_title, email_content, EMAIL_FROM, [email], html_message=html_message)
        # 发送成功
        if send_status:
            pass

    elif send_type == "forget":
        email_title = "慕课在线 注册密码重置"
        email_content = "请点击下面的链接重置密码: http://127.0.0.1:8000/reset/{0}".format(token) + "，链接将在30分钟后失效"

        # 使用Django内置函数来发送邮件
        send_status = send_mail(email_title, email_content, EMAIL_FROM, [email])
        if send_status:
            pass

    elif send_type == "update_email":
        code = random_str(4)
        email_title = "慕课在线 修改邮箱验证码"
        email_content = "你的邮箱验证码为：{0}".format(code)

        send_status = send_mail(email_title, email_content, EMAIL_FROM, [email])
        if send_status:
            pass


def send_update_email(email):
    code = random_str(4)
    # 实例化一个EmailVerifyRecord对象
    email_record = EmailVerifyRecord()
    # 生成随机的code放入链接
    email_record.code = code
    email_record.email = email
    email_record.send_type = "update_email"

    email_record.save()

    email_title = "Mooc Online 修改邮箱验证码"
    email_content = "你的邮箱验证码为：{0}".format(code)

    send_status = send_mail(email_title, email_content, EMAIL_FROM, [email])
    if send_status:
        pass