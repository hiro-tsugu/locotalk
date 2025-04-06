# db_config.py
import mysql.connector
from dotenv import load_dotenv
import os

# .envファイルを読み込み
load_dotenv()

def get_connection():
    connection = mysql.connector.connect(
        host=os.getenv("DB_HOST"),
        user=os.getenv("DB_USER"),
        password=os.getenv("DB_PASSWORD"),
        database=os.getenv("DB_NAME"),
        charset=os.getenv("DB_CHARSET")
    )
    print("データベースに接続しました")
    return connection

# 単体実行で接続確認
if __name__ == '__main__':
    get_connection()
