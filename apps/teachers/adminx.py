import xadmin

from .models import Teacher


class TeacherAdmin(object):
    list_display = ['name', 'mobile', 'job', 'fav_nums']
    search_fields = ['name', 'mobile', 'job']
    list_filter = ['name', 'job', 'gender']
    model_icon = 'fa fa-user'
    import_excel = True

    # 定义重载post方法来获取excel表格中的数据
    def post(self, request, *args, **kwargs):
        if 'excel' in request.FILES:
            pass
        return super(TeacherAdmin, self).post(request, args, kwargs)
        


xadmin.site.register(Teacher, TeacherAdmin)