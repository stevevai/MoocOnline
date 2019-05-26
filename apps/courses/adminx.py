import xadmin


from .models import Course, Lesson, Video, CourseResources, CourseClassify2, CourseClassify


# 课程直接添加章节
# 没法完成在章节中再嵌套视频
# 但是可以有多个inline。在添加课程时添加课程资源
class LessonInline(object):
    model = Lesson
    extra = 0


class CourseResourcesInline(object):
    model = CourseResources
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


class CourseAdmin(object):
    list_display = ['name', 'desc', 'degree', 'learn_times',]
    search_fields = ['name', 'desc', 'detail', 'degree']
    list_filter = ['name', 'desc', 'degree', 'learn_times']
    # ordering = ['-click_nums']      # 默认排序
    relfield_style = 'fk-ajax'  # 当有外键指向时，会以ajax方式加载。下拉搜索框
    readonly_fields = ['fav_nums']    # 只读,不能修改
    exclude = ['learn_times']  # 详情页不显示；管理员添加视频时，触发器自动更新
    # 课程页直接添加章节
    inlines = [LessonInline, CourseResourcesInline]
    # 可以在列表上快速修改内容
    list_editable = ['degree', 'desc']
    # 配置ueditor,在ueditor.py中get
    # style_fields = {"detail": "ueditor"}

    # 如果是教师用户，则需要过滤列表中的数据
    def queryset(self):
        qs = super(CourseAdmin, self).queryset()
        if self.request.user.is_superuser:
            return qs
        else:
            return qs.filter(teacher=self.request.user.teacher)


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
xadmin.site.register(CourseClassify, CourseClassifyAdmin)
xadmin.site.register(CourseClassify2, CourseClassify2Admin)

