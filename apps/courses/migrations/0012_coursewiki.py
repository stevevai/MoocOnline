# Generated by Django 2.1.7 on 2019-05-30 22:42

import datetime
from django.db import migrations, models
import django.db.models.deletion
import mdeditor.fields


class Migration(migrations.Migration):

    dependencies = [
        ('courses', '0011_remove_course_is_banner'),
    ]

    operations = [
        migrations.CreateModel(
            name='CourseWiki',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('wiki', mdeditor.fields.MDTextField()),
                ('add_time', models.DateTimeField(default=datetime.datetime.now, verbose_name='添加时间')),
                ('course', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='courses.Course', verbose_name='课程')),
            ],
            options={
                'verbose_name': '课程Wiki',
                'verbose_name_plural': '课程Wiki',
            },
        ),
    ]