# Generated by Django 2.1.7 on 2019-05-18 17:50

from django.db import migrations


class Migration(migrations.Migration):

    dependencies = [
        ('courses', '0002_auto_20190518_1646'),
    ]

    operations = [
        migrations.RemoveField(
            model_name='course',
            name='detail',
        ),
    ]