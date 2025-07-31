import json, os, random, re
from flask import Flask, render_template, request, jsonify
from gtts import gTTS
from fuzzywuzzy import fuzz
import mysql.connector
from mysql.connector import Error

app = Flask(__name__)
app.static_folder = "static"

# Fungsi koneksi database menggunakan environment variable
def connect_db():
    host = os.getenv("DB_HOST")
    port = int(os.getenv("DB_PORT"))
    user = os.getenv("DB_USER")
    password = os.getenv("DB_PASSWORD")
    database = os.getenv("DB_NAME")

    print("🔧 DB:", host, port, user, database)

    return mysql.connector.connect(
        host=host,
        port=port,
        user=user,
        password=password,
        database=database
    )



# Load intents dari database
def load_intents_from_db():
    try:
        conn = connect_db()
        cur = conn.cursor(dictionary=True)
        cur.execute("SELECT * FROM intents")
        rows = cur.fetchall()

        intents = {"intents": []}
        for row in rows:
            intents["intents"].append({
                "tag": row["tag"],
                "patterns": json.loads(row["patterns"]),
                "responses": json.loads(row["responses"])
            })
        return intents
    except Error as e:
        print("Database error:", e)
        return {"intents": []}
    finally:
        if conn.is_connected():
            cur.close()
            conn.close()

intents = load_intents_from_db()

def clean_text(text):
    return re.sub(r"[^\w\s]", "", text.lower()).strip()

# Ambil semua keyword subject buku
def get_all_subject_keywords():
    try:
        conn = connect_db()
        cur = conn.cursor()
        cur.execute("SELECT DISTINCT subject FROM books")
        results = cur.fetchall()
        cur.close()
        conn.close()

        return [row[0].lower() for row in results if row[0]]
    except Error as e:
        print("DB Error (get_all_subject_keywords):", e)
        return []

# Pencarian berdasarkan judul buku
def search_books_by_title(user_input):
    try:
        conn = connect_db()
        cur = conn.cursor(dictionary=True)
        cur.execute("SELECT title, availability, location FROM books")
        books = cur.fetchall()
        cur.close()
        conn.close()

        best_score = 0
        matched_book = None

        for book in books:
            score = fuzz.partial_ratio(user_input.lower(), book['title'].lower())
            if score > best_score and score >= 75:
                best_score = score
                matched_book = book

        if matched_book:
            status = "tersedia" if matched_book['availability'] == 'tersedia' else "sedang dipinjam"
            return f"Buku \"{matched_book['title']}\" saat ini {status} (rak {matched_book['location']})", best_score, matched_book['title']

        return None, 0, None
    except Error as e:
        print("DB Error (search_books_by_title):", e)
        return None, 0, None

# Pencarian berdasarkan subject buku
def search_books_by_subject(user_input):
    subject_keywords = get_all_subject_keywords()
    matched_subject = None

    for keyword in subject_keywords:
        if keyword in user_input.lower():
            matched_subject = keyword
            break

    if not matched_subject:
        return None

    try:
        conn = connect_db()
        cur = conn.cursor(dictionary=True)
        query = """
        SELECT title, location FROM books 
        WHERE subject LIKE %s AND availability = 'tersedia'
        """
        cur.execute(query, ('%' + matched_subject + '%',))
        results = cur.fetchall()
        cur.close()
        conn.close()

        if results:
            lokasi_rak = results[0]['location']
            total = len(results)
            daftar_judul = "\n".join([f"{i+1}. {row['title']}" for i, row in enumerate(results)])
            return (
                f"Ada {total} buku tentang {matched_subject} di rak {lokasi_rak}:\n{daftar_judul}"
            )
        else:
            return f"Maaf, belum ada buku {matched_subject} yang tersedia saat ini."

    except Error as e:
        print("DB Error (books):", e)
        return None

# Pencocokan intent / subject / judul
def find_best_match(user_input):
    user_input = clean_text(user_input)

    # Berdasarkan subject
    dynamic_book_response = search_books_by_subject(user_input)
    if dynamic_book_response:
        return dynamic_book_response, 100, "pencarian_subject"

    # Berdasarkan judul
    book_title_response, book_score, book_pattern = search_books_by_title(user_input)
    if book_title_response:
        return book_title_response, book_score, book_pattern

    # Berdasarkan intent biasa
    best_score = 0
    best_response = "Maaf, saya tidak mengerti maksud Anda."
    best_pattern = ""

    for intent in intents['intents']:
        for pattern in intent['patterns']:
            pattern_clean = clean_text(pattern)
            score1 = fuzz.partial_ratio(user_input, pattern_clean)
            score2 = fuzz.token_sort_ratio(user_input, pattern_clean)
            final_score = (score1 + score2) / 2

            if final_score > best_score:
                best_score = final_score
                best_response = random.choice(intent['responses'])
                best_pattern = pattern

    if best_score < 80:
        return "Maaf, saya tidak mengerti maksud Anda.", best_score, ""

    return best_response, best_score, best_pattern

# Routing
@app.route("/")
def home():
    return render_template("index.html")

@app.route("/get")
def get_bot_response():
    user_txt = request.args.get("msg", "").strip()
    if not user_txt:
        return jsonify({"response": "Mohon masukkan pesan Anda.", "score": 0, "pattern": ""})

    response, score, pattern = find_best_match(user_txt)
    return jsonify({
        "response": response,
        "score": score,
        "pattern": pattern
    })

# Run server
if __name__ == "__main__":
    port = int(os.environ.get("PORT", 5000))
    app.run(debug=False, host="0.0.0.0", port=port)
