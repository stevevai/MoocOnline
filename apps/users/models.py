from django.db import models
from django.contrib.auth.models import AbstractUser

from datetime import datetime
from teachers.models import Teacher


# Create your models here.


class UserProfile(AbstractUser):
    job_list = (
        ("hd", u"后端开发工程师"), ("qd", u"前端开发工程师"),
        ("yd", u"移动开发工程师"), ("test", u"软件测试工程师"),
        ("linux", u"Linux系统工程师"), ("qz", u"全栈开发工程师"),
        ("sf", u"算法工程师"), ("student", u"学生"),
        ("sa", u"超级管理员"), ("admin", u"管理员"),
        ("teacher", u"教师")
    )
    type_list = (
        (0, u"超级管理员"), (1, u"管理员"),
        (2, u"教师"), (3, u"普通用户")
    )
    nick_name = models.CharField(max_length=50, verbose_name=u"昵称", default="", blank=True)
    # birday = models.DateField(verbose_name=u"生日", null=True, blank=True)
    job = models.CharField(max_length=10, choices=job_list, verbose_name="职位", default="", blank=True)
    gender = models.CharField(max_length=10, choices=(("male", u"男"), ("female", u"女"), ("secret", u"保密")),
                              default="secret", verbose_name=u"性别")
    address = models.CharField(max_length=100, default="", verbose_name=u"地址")
    mobile = models.CharField(max_length=11, null=True, blank=True)     # blank = True 代表表单非必填，null = True 属于数据库范畴
    signature = models.CharField(max_length=128, default="", blank=True)
    image = models.ImageField(upload_to="users/images/%Y/%m", default="image/default_tx.jpg", max_length=100,
                              verbose_name=u"用户头像")
    user_type = models.SmallIntegerField(choices=type_list, verbose_name=u"用户类型", default=3)
    # 为教师创建新账号，与教师表中的数据相关联
    teacher = models.ForeignKey(Teacher, verbose_name=u"教师", on_delete=models.SET_NULL, null=True)

    class Meta:
        verbose_name = u"用户信息"
        verbose_name_plural = verbose_name

    def __str__(self):
        return self.username


class EmailVerifyRecord(models.Model):
    code = models.CharField(max_length=20, verbose_name=u"验证码")
    email = models.EmailField(max_length=50, verbose_name=u"邮箱")
    send_type = models.CharField(choices=(("register", u"注册"), ("forget", u"找回密码"), ("update_email", u"修改邮箱")),
                                 max_length=15, verbose_name=u"验证码类型")
    send_time = models.DateTimeField(default=datetime.now, verbose_name="发送时间")

    class Meta:
        verbose_name = u"邮箱验证码"
        verbose_name_plural = verbose_name

    def __str__(self):
        return '{0}({1})'.format(self.code, self.email)