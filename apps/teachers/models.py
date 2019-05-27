from django.db import models
from django.contrib.auth.models import AbstractUser

from datetime import datetime
# Create your models here.


# 让上传的文件路径动态地与user的名字有关
def upload_to_path(instance, filename):
    name = instance.name
    return 'teacher/images/%s/%s' % (name, filename)


class Teacher(models.Model):
    job_list = (
        ("hd", u"后端开发工程师"), ("qd", u"前端开发工程师"),
        ("yd", u"移动开发工程师"), ("test", u"软件测试工程师"),
        ("linux", u"Linux系统工程师"), ("qz", u"全栈开发工程师"),
        ("sf", u"算法工程师"), ("student", u"学生")
    )
    name = models.CharField(max_length=50, verbose_name=u"教师名")
    image = models.ImageField(
        default='image/default_t.png',
        upload_to=upload_to_path,
        verbose_name=u"头像",
        max_length=100)
    gender = models.CharField(max_length=10, choices=(("male", u"男"), ("female", u"女"), ("secret", u"保密")),
                              default="secret", verbose_name=u"性别")
    mobile = models.CharField(max_length=11, null=True, blank=True)  # blank = True 代表表单非必填，null = True 属于数据库范畴
    job = models.CharField(max_length=50, choices=job_list, verbose_name=u"公司职位")
    points = models.CharField(max_length=50, verbose_name=u"教学特点", null=True)
    fav_nums = models.IntegerField(default=0, verbose_name=u"收藏数")
    add_time = models.DateTimeField(default=datetime.now)

    class Meta:
        verbose_name = u"教师信息"
        verbose_name_plural = verbose_name

    # 统计该教师的课程数量
    def get_course_nums(self):
        return self.course_set.all().count()

    def __str__(self):
        return self.name


