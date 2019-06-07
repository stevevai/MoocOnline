from django.db import models
from datetime import datetime

from teachers.models import Teacher

from DjangoUeditor.models import UEditorField
from mdeditor.fields import MDTextField
# Django-taggit
from taggit.managers import TaggableManager

# from model_utils import FieldTracker
# Create your models here.


# 让上传的文件路径动态地与course的名字有关
def upload_to_path(instance, filename):
    name = instance.name
    return 'courses/images/%s/%s' % (name, filename)


def upload_video_path(instance, filename):
    name = instance.name
    file_name = str(datetime.now()) + '_' + filename
    return 'courses/videos/%s/%s' % (name, file_name)


# 一级分类
class CourseClassify(models.Model):
    name = models.CharField(max_length=20, verbose_name=u"一级分类名称")
    add_time = models.DateTimeField(default=datetime.now, verbose_name=u"添加时间")

    class Meta:
        verbose_name = u"课程一级分类"
        verbose_name_plural = verbose_name

    def __str__(self):
        return self.name


# 二级分类
class CourseClassify2(models.Model):
    name = models.CharField(max_length=20, verbose_name=u"二级分类")
    parent_classify = models.ForeignKey(CourseClassify, verbose_name=u"一级分类", on_delete=models.CASCADE, null=True)
    add_time = models.DateTimeField(default=datetime.now, verbose_name=u"添加时间")

    class Meta:
        verbose_name = u"课程二级分类"
        verbose_name_plural = verbose_name

    def __str__(self):
        return self.name


class Course(models.Model):
    name = models.CharField(max_length=50, verbose_name=u"课程名")
    desc = models.CharField(max_length=500, verbose_name=u"课程简要描述")
    # 富文本编辑器
    # detail = UEditorField(verbose_name=u"课程详情",width=600, height=300, imagePath="courses/ueditor/",
    # filePath="courses/ueditor/", default='')
    detail = models.TextField(verbose_name=u"课程详情", default='')
    degree = models.CharField(choices=(("cj", "初级"), ("zj", "中级"), ("gj", "高级")), max_length=2, verbose_name=u"难度")
    learn_times = models.IntegerField(default=0, verbose_name=u"学习时长(分钟)")
    teacher = models.ForeignKey(Teacher, verbose_name=u"讲师", null=True, blank=True, on_delete=models.CASCADE)
    stu_nums = models.IntegerField(default=0, verbose_name=u"学习人数")
    fav_nums = models.IntegerField(default=0, verbose_name=u"收藏人数")
    image = models.ImageField(upload_to=upload_to_path, verbose_name="封面图", max_length=100)
    classify_root = models.ForeignKey(CourseClassify, verbose_name=u"一级分类", on_delete=models.SET_NULL, default="", null=True)
    classify_detail = models.ForeignKey(CourseClassify2, verbose_name=u"二级分类", on_delete=models.SET_NULL, default="", null=True)
    # category = models.CharField(max_length=20, default=u"", verbose_name=u"课程类别")
    # 加一张课程与标签的中间表
    # tag = models.CharField(max_length=15, verbose_name=u"课程标签", default=u"")
    # 标签
    tags = TaggableManager(verbose_name=u"课程标签", blank=True)
    you_need_know = models.TextField(default="", verbose_name=u"课程须知")
    teacher_tell = models.TextField(default="", verbose_name=u"老师告诉你")
    # is_banner = models.BooleanField(default=False, verbose_name=u"是否轮播")
    add_time = models.DateTimeField(default=datetime.now, verbose_name=u"添加时间")

    class Meta:
        verbose_name = u"课程"
        verbose_name_plural = verbose_name

    def get_zj_nums(self):
        # 获取课程章节数的方法
        return self.lesson_set.all().count()

    # 自定义函数作为列
    get_zj_nums.short_description = "章节数"

    def get_course_lesson(self):
        # 获取课程所有章节
        return self.lesson_set.all()

    def __str__(self):
        return self.name


# 章
class Lesson(models.Model):
    course = models.ForeignKey(Course, verbose_name=u"课程", on_delete=models.CASCADE)
    name = models.CharField(max_length=100, verbose_name=u"章节名")
    add_time = models.DateTimeField(default=datetime.now, verbose_name=u"添加时间")

    class Meta:
        verbose_name = u"章节"
        verbose_name_plural = verbose_name

    def __str__(self):
        return self.name

    def get_lesson_video(self):
        # 获取章节视频信息
        return self.video_set.all()


# 节
class Video(models.Model):
    lesson = models.ForeignKey(Lesson, verbose_name=u"章节", on_delete=models.CASCADE)
    name = models.CharField(max_length=100, verbose_name=u"视频名")
    # 上传视频，存取外链
    video_file = models.FileField(upload_to=upload_video_path, verbose_name=u"视频地址", max_length=200, default="")
    # url = models.CharField(max_length=200, default="", verbose_name=u"访问地址")
    add_time = models.DateTimeField(default=datetime.now, verbose_name=u"添加时间")
    # 使用分钟做后台记录(存储最小单位)前台转换
    learn_times = models.IntegerField(default=0, verbose_name=u"学习时长(分钟数)")

    # learn_times_tracker = FieldTracker(fields=['learn_times'])

    class Meta:
        verbose_name = u"视频"
        verbose_name_plural = verbose_name

    def get_course(self):
        return self.lesson.course

    get_course.short_description = "课程"

    '''
    # 重载save()方法
    def save(self):
        # 调用父类方法
        super(Video, self).save()
        
        course = self.lesson.course
        learn_time = 0
        for lesson in course.get_course_lesson():
            for video in lesson.get_lesson_video():
                learn_time += video.learn_times
        course.save()
    '''

    def __str__(self):
        return self.name


class CourseWiki(models.Model):
    course = models.ForeignKey(Course, verbose_name=u"课程", on_delete=models.CASCADE)
    wiki = MDTextField()
    add_time = models.DateTimeField(default=datetime.now, verbose_name=u"添加时间")

    def __str__(self):
        return self.course.name+"Wiki"

    class Meta:
        verbose_name = "课程Wiki"
        verbose_name_plural = verbose_name


class CourseResources(models.Model):
    course = models.ForeignKey(Course, verbose_name=u"课程", on_delete=models.CASCADE)
    name = models.CharField(max_length=100, verbose_name=u"资源名称")
    download = models.FileField(upload_to="course/resource/%Y/%m", verbose_name=u"资源文件", max_length=100)
    add_time = models.DateTimeField(default=datetime.now, verbose_name=u"添加时间")

    class Meta:
        verbose_name = u"课程资源"
        verbose_name_plural = verbose_name

    def __str__(self):
        return self.name