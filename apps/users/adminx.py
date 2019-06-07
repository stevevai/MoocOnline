import xadmin
from xadmin import views

# from .models import EmailVerifyRecord, Banner
from xadmin.plugins.auth import UserAdmin
from xadmin.models import Log
from users.models import UserProfile
from operation.models import Banner
from teachers.models import Teacher
from courses.models import Course, CourseWiki, CourseResources, CourseClassify, CourseClassify2, Video, Lesson
# Register your models here.


class BaseSetting(object):
    enable_themes = True
    use_bootswatch = True


class GlobalSettings(object):
    site_title = "后台管理系统"
    site_footer = "Mooc Online"
    menu_style = "accordion"   # 可折叠
    '''
    def get_site_menu(self):
        return (
            {'title': '用户管理', 'menus': (
                {'title': '用户信息', 'icon': 'fa fa-user', 'url': self.get_model_url(UserProfile, 'changelist')},
                {'title': '教师信息', 'icon': 'fa fa-user', 'url': self.get_model_url(Teacher, 'changelist')}
            )},

            {'title': '课程管理', 'menus': (
                {'title': '课程信息', 'icon': 'fa fa-cloud', 'url': self.get_model_url(Course, 'changelist')},
                {'title': '章节信息', 'icon': 'fa fa-folder', 'url': self.get_model_url(Lesson, 'changelist')},
                {'title': '视频信息', 'icon': 'fa fa-video-camera', 'url': self.get_model_url(Video, 'changelist')},
                {'title': '课程资源', 'icon': 'fa fa-file', 'url': self.get_model_url(CourseResources, 'changelist')},
                {'title': '课程Wiki', 'icon': 'fa fa-leaf', 'url': self.get_model_url(CourseWiki, 'changelist')},
                {'title': '一级分类', 'icon': 'fa fa-book', 'url': self.get_model_url(CourseClassify, 'changelist')},
                {'title': '二级分类', 'icon': 'fa fa-book', 'url': self.get_model_url(CourseClassify2, 'changelist')},
            )},

            {'title': '系统管理', 'menus': (
                {'title': '首页轮播', 'icon': 'fa fa-picture-o', 'url': self.get_model_url(Banner, 'changelist')},
                {'title': '日志记录', 'icon': 'fa fa-cog', 'url': self.get_model_url(Log, 'changelist')},
            )}
        )
    '''


class UserProfileAdmin(UserAdmin):
    '''
    list_display = ['nick_name', 'user_type', 'user_type', 'is_staff', 'date_joined']
    model_icon = 'fa fa-user'
    '''


# xadmin.site.register(UserProfile, UserProfileAdmin)
xadmin.site.register(views.BaseAdminView, BaseSetting)
xadmin.site.register(views.CommAdminView, GlobalSettings)

