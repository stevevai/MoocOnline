# Generated by Django 2.1.7 on 2019-05-17 23:43

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('users', '0001_initial'),
    ]

    operations = [
        migrations.AlterField(
            model_name='userprofile',
            name='image',
            field=models.ImageField(default='image/default_s.png', upload_to='users/images', verbose_name='用户头像'),
        ),
    ]
