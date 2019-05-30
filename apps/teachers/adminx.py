import xadmin

from .models import Teacher


class TeacherAdmin(object):
    list_display = ['name', 'mobile', 'job', 'fav_nums']
    search_fields = ['name', 'mobile', 'job']
    list_filter = ['name', 'job', 'gender']
    model_icon = 'fa fa-user'


xadmin.site.register(Teacher, TeacherAdmin)