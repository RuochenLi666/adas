
import sys

try:
    import pymysql
    print("pymysql available")
except ImportError:
    try:
        import mysql.connector
        print("mysql.connector available")
    except ImportError:
        print("no mysql driver")
