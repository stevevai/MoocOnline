import xadmin

from .models import Banner


class BannerAdmin(object):
    # 显示不要用image，而应该用image_img
    list_display = ['title', 'image_img', 'url', 'index', 'add_time']
    search_fields = ['title', 'url', 'index']
    list_filter = ['title',  'url', 'index', 'add_time']
    model_icon = 'fa fa-picture-o'


# 注册轮播图
xadmin.site.register(Banner, BannerAdmin)