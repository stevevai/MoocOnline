from django.db import models

from datetime import datetime

from users.models import UserProfile
from courses.models import Course, Video

from ckeditor.fields import RichTextField
from ckeditor_uploader.fields import RichTextUploadingField
from stdimage.models import StdImageField
from stdimage.utils import UploadToUUID
# Create your models here.


# 轮播图
class Banner(models.Model):
    title = models.CharField(max_length=100, verbose_name=u"标题")
    # image = models.ImageField(upload_to="banner/%Y/%m", verbose_name=u"轮播图", max_length=100)
    image = StdImageField(max_length=100,
                          upload_to=UploadToUUID(path=datetime.now().strftime('banner/%Y/%m')),
                          verbose_name=u"轮播图",
                          variations={'thumbnail': {'width': 100, 'height': 75}})
    url = models.URLField(max_length=200, verbose_name=u"访问地址")
    index = models.IntegerField(default=0, verbose_name=u"顺序")
    add_time = models.DateTimeField(default=datetime.now, verbose_name=u"添加时间")

    class Meta:
        verbose_name = u"轮播图"
        verbose_name_plural = verbose_name

    def image_img(self):
        if self.image:
            return str('<img src="%s" />' % self.image.thumbnail.url)
        else:
            return u'上传图片'

    image_img.short_description = '轮播图'
    image_img.allow_tags = True
    
    def __str__(self):
        return '{0}(位于第{1}位)'.format(self.title, self.index)

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


class UserNote(models.Model):
    user = models.ForeignKey(UserProfile, verbose_name=u"用户名", on_delete=models.CASCADE)
    course = models.ForeignKey(Course, verbose_name=u"课程", on_delete=models.CASCADE)
    # 章节
    video = models.ForeignKey(Video, verbose_name=u"章节", on_delete=models.CASCADE, null=True)
    # notes = RichTextField()
    # 使用这种类型可以上传图片
    notes = RichTextUploadingField()
    add_time = models.DateTimeField(default=datetime.now, verbose_name=u"添加时间")


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
    add_time = models.DateTimeField(default=datetime.now, verbose_name=u"添加时间")

    class Meta:
        verbose_name = u"用户课程"
        verbose_name_plural = verbose_name

