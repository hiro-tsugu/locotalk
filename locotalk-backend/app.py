
from flask import Flask, request, jsonify
from flask_cors import CORS
from db_config import get_connection
from datetime import datetime
import base64

app = Flask(__name__)
CORS(app, resources={r"/api/*": {"origins": "http://localhost:3000"}})  # フロントとの通信を許可

# 📌 レポート一覧取得API（クエリパラメータ版）
@app.route('/api/reports', methods=['GET'])
def get_reports_by_query():
    municipality_id = request.args.get('municipality_id')

    if not municipality_id:
        return jsonify({'error': 'municipality_id is required'}), 400

    conn = get_connection()
    cursor = conn.cursor(dictionary=True)

# nickname追加
    query = """
        SELECT r.id, r.title, r.body, r.created_at, i.image_data, u.nickname
        FROM reports r
        LEFT JOIN images i ON r.image_id = i.id
        LEFT JOIN users u ON r.user_id = u.id
        WHERE r.municipality_id = %s
        ORDER BY r.created_at DESC
    """
    cursor.execute(query, (municipality_id,))
    reports = cursor.fetchall()

    for report in reports:
        if report['image_data']:
            report['image_data'] = base64.b64encode(report['image_data']).decode('utf-8')
        else:
            report['image_data'] = None

    cursor.close()
    conn.close()
    return jsonify(reports)

# 📌 レポート投稿API
@app.route('/api/reports', methods=['POST'])
def create_report():
    try:
        title = request.form['title']
        body = request.form['body']
        user_id = request.form['user_id']
        municipality_id = request.form['municipality_id']
        image_file = request.files.get('image')

        conn = get_connection()
        cursor = conn.cursor()

        image_id = None
        if image_file:
            image_data = image_file.read()
            cursor.execute(
                "INSERT INTO images (image_data, created_at) VALUES (%s, %s)",
                (image_data, datetime.now())
            )
            image_id = cursor.lastrowid

        cursor.execute("""
            INSERT INTO reports (user_id, municipality_id, title, body, image_id, created_at)
            VALUES (%s, %s, %s, %s, %s, %s)
        """, (user_id, municipality_id, title, body, image_id, datetime.now()))

        conn.commit()
    except Exception as e:
        return jsonify({'error': str(e)}), 500
    finally:
        cursor.close()
        conn.close()

    return jsonify({'message': 'Report created successfully'})

# 📌 自治体一覧取得API
@app.route('/api/municipalities', methods=['GET'])
def get_municipalities():
    conn = get_connection()
    cursor = conn.cursor(dictionary=True)
    cursor.execute("SELECT id, name, prefecture FROM municipalities ORDER BY prefecture, name")
    municipalities = cursor.fetchall()
    cursor.close()
    conn.close()
    return jsonify(municipalities)

# 📌 レポート削除API
@app.route('/api/reports/<int:report_id>', methods=['DELETE'])
def delete_report(report_id):
    conn = get_connection()
    cursor = conn.cursor(dictionary=True)

    cursor.execute("SELECT image_id FROM reports WHERE id = %s", (report_id,))
    report = cursor.fetchone()

    if not report:
        cursor.close()
        conn.close()
        return jsonify({'error': 'Report not found'}), 404

    if report['image_id']:
        cursor.execute("DELETE FROM images WHERE id = %s", (report['image_id'],))

    cursor.execute("DELETE FROM reports WHERE id = %s", (report_id,))
    conn.commit()

    cursor.close()
    conn.close()
    return jsonify({'message': 'Report deleted successfully'}), 200

# 📌 アプリ起動
if __name__ == '__main__':
    app.run(debug=True)
