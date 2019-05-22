from django.db import models

from datetime import datetime

from users.models import UserProfile
from courses.models import Course, Video
# Create your models here.


# 轮播图
class Banner(models.Model):
    title = models.CharField(max_length=100, verbose_name=u"标题")
    image = models.ImageField(upload_to="banner/%Y/%m", verbose_name=u"轮播图", max_length=100)
    url = models.URLField(max_length=200, verbose_name=u"访问地址")
    index = models.IntegerField(default=0, verbose_name=u"顺序")
    add_time = models.DateTimeField(default=datetime.now, verbose_name=u"添加时间")

    class Meta:
        verbose_name = u"轮播图"
        verbose_name_plural = verbose_name


class CourseComments(models.Model):
    user = models.ForeignKey(UserProfile, verbose_name=u"用户名", on_delete=models.CASCADE)
    course = models.ForeignKey(Course, verbose_name=u"课程", on_delete=models.CASCADE)
    # 章节
    video = models.ForeignKey(Video, verbose_name=u"章节", on_delete=models.CASCADE, null=True)
    comments = models.CharField(max_length=200, verbose_name=u"评论")
    add_time = models.DateTimeField(default=datetime.now, verbose_name=u"添加时间")

    class Meta:
        verbose_name = u"课程评论"
        verbose_name_plural = verbose_name


class UserFavourite(models.Model):
    user = models.ForeignKey(UserProfile, verbose_name=u"用户名", on_delete=models.CASCADE)
    fav_id = models.IntegerField(default=0, verbose_name=u"收藏内容id")
    fav_type = models.IntegerField(choices=(("1", "课程"), ("2", "讲师")), default=1, verbose_name=u"收藏类型")
    add_time = models.DateTimeField(default=datetime.now, verbose_name=u"添加时间")

    class Meta:
        verbose_name = u"用户收藏"
        verbose_name_plural = verbose_name


# 用户点击观看视频或者开始学习后，则记录用户的学习状态
class UserCourse(models.Model):
    user = models.ForeignKey(UserProfile, verbose_name=u"用户名", on_delete=models.CASCADE)
    course = models.ForeignKey(Course, verbose_name=u"课程", on_delete=models.CASCADE)
    section = models.ForeignKey(Video, verbose_name=u"章节", on_delete=models.CASCADE)
    # 记录学习状态，分为已学完和未学完
    status = models.SmallIntegerField(default=0, choices=(("0", "未学完"), ("1", "已学完")), verbose_name=u"学习状态")
    add_time = models.DateTimeField(default=datetime.now, verbose_name=u"添加时间")

    class Meta:
        verbose_name = u"用户课程"
        verbose_name_plural = verbose_name
