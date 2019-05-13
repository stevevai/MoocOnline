# 使用pymysql作为数据库驱动，这种方法在Django 2.2不适用

import pymysql
pymysql.install_as_MySQLdb()