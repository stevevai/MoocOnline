# Generated by Django 2.1.7 on 2019-05-17 23:49

import datetime
from django.db import migrations, models


class Migration(migrations.Migration):

    initial = True

    dependencies = [
    ]

    operations = [
        migrations.CreateModel(
            name='Teacher',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('name', models.CharField(max_length=50, verbose_name='教师名')),
                ('image', models.ImageField(default='image/default_t.png', upload_to='teacher/images', verbose_name='头像')),
                ('gender', models.CharField(choices=[('male', '男'), ('female', '女'), ('secret', '保密')], default='secret', max_length=10, verbose_name='性别')),
                ('mobile', models.CharField(blank=True, max_length=11, null=True)),
                ('job', models.CharField(choices=[('hd', '后端开发工程师'), ('qd', '前端开发工程师'), ('yd', '移动开发工程师'), ('test', '软件测试工程师'), ('linux', 'Linux系统工程师'), ('qz', '全栈开发工程师'), ('sf', '算法工程师'), ('student', '学生')], max_length=50, verbose_name='公司职位')),
                ('points', models.CharField(max_length=50, null=True, verbose_name='教学特点')),
                ('fav_nums', models.IntegerField(default=0, verbose_name='收藏数')),
                ('add_time', models.DateTimeField(default=datetime.datetime.now)),
            ],
            options={
                'verbose_name': '教师',
                'verbose_name_plural': '教师',
            },
        ),
    ]