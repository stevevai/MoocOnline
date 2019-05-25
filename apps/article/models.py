from django.db import models
from users.models import UserProfile
from datetime import datetime


# 博客文章数据模型
class Article(models.Model):
    author = models.ForeignKey(UserProfile, on_delete=models.CASCADE, verbose_name=u"文章作者")
    title = models.CharField(max_length=100, verbose_name=u"文章标题")
    body = models.TextField(verbose_name=u"文章内容")
    created = models.DateTimeField(default=datetime.now, verbose_name=u"创建时间")
    # auto_now=True 指定每次数据更新时自动写入当前时间
    updated = models.DateTimeField(auto_now=True, verbose_name=u"更新时间")

    # 内部类 class Meta 用于给 model 定义元数据
    class Meta:
        # ordering 指定模型返回的数据的排列顺序
        # '-created' 表明数据应该以倒序排列
        verbose_name = u"手记"
        ordering = ('-created',)

    # 函数 __str__ 定义当调用对象的 str() 方法时的返回值内容
    def __str__(self):
        # return self.title 将文章标题返回
        return self.title
