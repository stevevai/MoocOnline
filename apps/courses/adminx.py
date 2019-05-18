import xadmin


from .models import Course, Lesson, Video, CourseResources, CourseClassify2, CourseClassify, BannerCourse


# 课程直接添加章节
# 没法完成在章节中再嵌套视频
# 但是可以有多个inline。在添加课程时添加课程资源
class LessonInline(object):
    model = Lesson
    extra = 0


class CourseResourceInline(object):
    model = Lesson
    extra = 0


class CourseClassify2InLine(object):
    model = CourseClassify2
    extra = 0


class CourseClassifyAdmin(object):
    inlines = [CourseClassify2InLine]


class CourseClassify2Admin(object):
    pass


class LessonInline(object):
    model = Lesson
    extra = 0


class CourseResourceInline(object):
    model = Lesson
    extra = 0


# Course的admin管理器
class BannerCourseAdmin(object):
    list_display = ['name', 'desc', 'degree', 'learn_times', 'students']
    search_fields = ['name', 'desc', 'degree', 'students']
    list_filter = ['name', 'desc', 'degree', 'learn_times', 'students']
    # ordering = {''}
    # readonly_fields =['']
    exclude = ['fav_nums']
    # 课程直接添加章节
    inlines = [LessonInline, CourseResourceInline]

    # 重载queryset方法。过滤列表中的数据
    def queryset(self):
        qs = super(BannerCourseAdmin, self).queryset()
        qs = qs.filter(is_banner=True)
        return qs


class CourseAdmin(object):
    list_display = ['name', 'desc', 'degree', 'learn_times',]
    search_fields = ['name', 'desc', 'detail', 'degree']
    list_filter = ['name', 'desc', 'degree', 'learn_times']
    # ordering = ['-click_nums']      # 默认排序
    readonly_fields = ['fav_nums']    # 只读,不能修改
    # exclude = ['']  # 详情页不显示
    # 课程页直接添加章节
    inlines = [LessonInline]
    # 可以在列表上快速修改内容
    list_editable = ['degree', 'desc']
    # 配置ueditor,在ueditor.py中get
    # style_fields = {"detail": "ueditor"}

    # 过滤列表中的数据
    def queryset(self):
        qs = super(CourseAdmin, self).queryset()
        qs = qs.filter(is_banner=False)
        return qs


class LessonAdmin(object):
    list_display = ['course', 'name', 'add_time']
    search_fields = ['course', 'name']
    list_filter = ['course__name', 'name', 'add_time']      # 由外键course的name字段过滤


class VideoAdmin(object):
    list_display = ['lesson', 'name', 'add_time']
    search_fields = ['lesson', 'name']
    list_filter = ['lesson', 'name', 'add_time']


class CourseResourceAdmin(object):
    list_display = ['course', 'name', 'download', 'add_time']
    search_fields = ['course', 'name', 'download']
    list_filter = ['course', 'name', 'download', 'add_time']


xadmin.site.register(Course, CourseAdmin)
xadmin.site.register(Lesson, LessonAdmin)
xadmin.site.register(Video, VideoAdmin)
xadmin.site.register(CourseResources, CourseResourceAdmin)
xadmin.site.register(BannerCourse, BannerCourseAdmin)
xadmin.site.register(CourseClassify, CourseClassifyAdmin)
xadmin.site.register(CourseClassify2, CourseClassify2Admin)

