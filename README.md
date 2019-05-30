# MoocOnline


毕业设计，基于Python设计与实现一个专注于编程教育的在线学习平台

- [x] 首页轮播图，课程列表显示
- [ ] 首页数据Redis缓存
- [x] Xadmin后台优化（图标，显示
- [x] 课程分页bug修改
- [ ] 发现页（界面同首页，无轮播图，分为猜你喜欢（基于课程二级分类筛选），相似推荐（基于用户）
- [ ] 修改前端页面中的链接
- [ ] 前端页面优化，统一页头页尾，logo,font，页脚粘性
- [ ] 配置一份文件存储在本地的settings.py文件，将七牛云已上传的文件备份一份到本地
- [x] 项目开发总结
- [ ] 查阅相关论文和资料
- [ ] ~~404,500页面配置~~
- [ ] ~~docker部署（最好在Linux虚拟机上玩~~

</br>

展望：

- Django rest framework
- Web app移动端适配
- 全局搜索（搜索引擎，建索引），加快搜索速度
- 部署在Nginx服务器上
- docker部署
- 课程推荐算法

</br>

其它需要注意的问题：

1. 测试的数据集要有多大？

2. 为了演示时的效果，浏览器的缓存不要清除，且网页打开要比较流畅

3. 写下部署在服务器上的思路，但实际上不部署

   

## 项目总结

### 相关技术

| **Name**                        | **Offical website**                           |
| ------------------------------- | --------------------------------------------- |
| Python                          | <https://www.python.org/>                     |
| Django                          | <https://docs.djangoproject.com/zh-hans/2.2/> |
| MySQL                           | <https://www.mysql.com/>                      |
| Redis                           | <https://redis.io/>                           |
| Celery                          | <http://www.celeryproject.org/>               |
| Nginx                           | <https://nginx.org/en/>                       |
| Bootstrap                       | <http://www.bootcss.com/>                     |
| HTML/CSS/JavaScript/jQuery/Ajax |                                               |

### 第三方库

| Name                   | Github repository                                            |
| ---------------------- | ------------------------------------------------------------ |
| xadmin                 | <https://github.com/sshwsfc/xadmin>                          |
| django-crispy-forms    | <https://github.com/django-crispy-forms/django-crispy-forms> |
| django-simple-captcha  | <https://github.com/mbi/django-simple-captcha>               |
| django-ckeditor        | <https://github.com/django-ckeditor/django-ckeditor>         |
| django-qiniu-storage   | <https://github.com/glasslion/django-qiniu-storage>          |
| django-pure-pagination | <https://github.com/jamespacileo/django-pure-pagination>     |
| django-stdimage        | <https://github.com/codingjoe/django-stdimage>               |
| django-redis           | <https://github.com/niwinz/django-redis>                     |
| itsdangerous           | <https://github.com/pallets/itsdangerous>                    |
| Pillow                 | <https://github.com/python-pillow/Pillow>                    |
| PyMySQL                | <https://github.com/PyMySQL/PyMySQL>                         |

### 参考资料

| Name                                                 | Website                                                      |
| ---------------------------------------------------- | ------------------------------------------------------------ |
| Python升级3.6强力Django+杀手级Xadmin打造在线教育平台 | <https://coding.imooc.com/class/78.html>                     |
| Java SSM快速开发仿慕课网在线教育平台                 | <https://coding.imooc.com/class/110.html>                    |
| 传播智客2018年Django天天生鲜项目                     | <https://github.com/shihao1010/tiantianshengxian>            |
| Xadmin官方文档                                       | <https://sshwsfc.github.io/xadmin/>                          |
| 使用PyMySQL连接数据库                                | <https://www.jianshu.com/p/82781add8449>                     |
| Virtualenv虚拟环境使用                               | <https://www.cnblogs.com/jasmine-Jobs/p/7045016.html>        |
| Celery中文文档                                       | <http://docs.jinkan.org/docs/celery/getting-started/introduction.html#id3> |
| Python在线教育平台学习笔记                           | <https://mtianyan.gitee.io/post/8b4c6c13.html>               |
| Xadmin缩略图处理                                     | <https://www.jianshu.com/p/c72660280113>                     |
| Xadmin在Django 2.0版本下的安装                       | <https://blog.csdn.net/xujin0/article/details/84583969>      |
| Xadmin的功能与设置                                   | <https://www.kancloud.cn/net_you/django_xadmin/388358>       |
| Xadmin中自定义内容的变量                             | <http://www.lybbn.cn/data/bbsdatas.php?lybbs=62>             |
| Django Filefield动态改变上传位置                     | <http://www.voidcn.com/article/p-xcanyfmh-qv.html>           |
| Django中文文档                                       | <https://django-chinese-doc.readthedocs.io/zh_CN/latest/intro/index.html> |
| Xadmin文档（一）                                     | <https://blog.csdn.net/kingken212/article/details/46992535>  |
| 富文本编辑器引入                                     | <https://www.dusaiphoto.com/article/detail/60/>              |
| 富文本编辑器上传图片                                 | <https://python-ning.github.io/2016/04/12/python_django_blog_ckeditor/> |
| ckeditor前台ajax提交表单                             | <https://github.com/able8/Django-Course>                     |
| celery异步发送邮件                                   | <http://projectsedu.com/>                                    |
| 加入apps目录的搜索路径                               | <https://blog.csdn.net/dcrmg/article/details/79546962>       |
| 自定义用户类，数据库同步异常                         | <https://www.cnblogs.com/zhangjpn/articles/6694480.html>     |
| Celery版本的问题                                     | <https://foofish.net/celery_windows_error.html>              |
|                                                      | <https://www.jianshu.com/p/c44ace7da5bf>                     |

### 前端设计

| Name              | Website                                                 |
| ----------------- | ------------------------------------------------------- |
| Boostrap模板      | <https://www.froala.com/design-blocks/docs/get-started> |
| Boostrap模板      | <https://startbootstrap.com/#template>                  |
| Boostrap表单验证  | <https://formvalidation.io/>                            |
| Boostrap主题      | <https://bootswatch.com/>                               |
| Bootstrap中文文档 | <https://v3.bootcss.com/>                               |

### 优秀博客

| 追梦人物的博客 | <https://www.zmrenwu.com/>                    |
| -------------- | --------------------------------------------- |
| 刘江的博客     | <http://www.liujiangblog.com/course/django/2> |
| 杜赛的个人网站 | <https://www.dusaiphoto.com/>                 |

