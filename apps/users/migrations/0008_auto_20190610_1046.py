# Generated by Django 2.1.7 on 2019-06-10 10:46

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('users', '0007_auto_20190524_0052'),
    ]

    operations = [
        migrations.AlterField(
            model_name='userprofile',
            name='image',
            field=models.ImageField(default='image/default_tx.jpg', upload_to='users/images/%Y/%m', verbose_name='用户头像'),
        ),
    ]
