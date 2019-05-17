from django.db import models
from django.contrib.auth.models import AbstractUser


# Create your models here.


class UserProfile(AbstractUser):
    job_list = (
        ("hd", u"后端开发工程师"), ("qd", u"前端开发工程师"),
        ("yd", u"移动开发工程师"), ("test", u"软件测试工程师"),
        ("linux", u"Linux系统工程师"), ("qz", u"全栈开发工程师"),
        ("sf", u"算法工程师"), ("student", u"学生")
    )
    nick_name = models.CharField(max_length=50, verbose_name=u"昵称", default="", blank=True)
    # birday = models.DateField(verbose_name=u"生日", null=True, blank=True)
    job = models.CharField(max_length=10, choices=job_list, verbose_name="职位", default="", blank=True)
    gender = models.CharField(max_length=10, choices=(("male", u"男"), ("female", u"女"), ("secret", u"保密")),
                              default="secret", verbose_name=u"性别")
    address = models.CharField(max_length=100, default="", verbose_name=u"地址")
    mobile = models.CharField(max_length=11, null=True, blank=True)     # blank = True 代表表单非必填，null = True 属于数据库范畴
    signature = models.CharField(max_length=128, default="", blank=True)
    image = models.ImageField(upload_to="users/images", default="image/default_s.png", max_length=100,
                              verbose_name=u"用户头像")

    class Meta:
        verbose_name = u"用户信息"
        verbose_name_plural = verbose_name

    def __str__(self):
        return self.username
