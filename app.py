import json, os, random, re
from flask import Flask, render_template, request, jsonify
from fuzzywuzzy import fuzz
from dotenv import load_dotenv

# Load environment variables
load_dotenv()

app = Flask(__name__)
app.static_folder = "static"

# Hardcoded intents untuk testing (nanti bisa pindah ke database)
INTENTS_DATA = {
    "intents": [
        {
            "tag": "greeting",
            "patterns": ["hai", "hello", "halo", "selamat pagi", "selamat siang", "hei", "hi"],
            "responses": [
                "Halo! Saya chatbot perpustakaan. Ada yang bisa saya bantu?",
                "Hai! Silakan tanya tentang buku atau layanan perpustakaan.",
                "Selamat datang di perpustakaan digital! Ada yang ingin dicari?"
            ]
        },
        {
            "tag": "book_search",
            "patterns": ["cari buku", "buku", "ada buku", "dimana buku", "lokasi buku"],
            "responses": [
                "Silakan sebutkan judul atau subjek buku yang Anda cari!",
                "Buku apa yang ingin Anda temukan? Saya akan membantu mencarinya.",
                "Sebutkan judul buku atau topik yang Anda minati."
            ]
        },
        {
            "tag": "location",
            "patterns": ["dimana", "lokasi", "rak", "lantai", "tempat"],
            "responses": [
                "Untuk mencari lokasi buku, sebutkan judul bukunya dulu ya!",
                "Buku biasanya tersusun berdasarkan kategori. Judul buku apa yang dicari?"
            ]
        },
        {
            "tag": "hours",
            "patterns": ["jam buka", "buka jam berapa", "tutup jam berapa", "jam operasional"],
            "responses": [
                "Perpustakaan buka Senin-Jumat pukul 08:00-16:00, Sabtu 08:00-12:00.",
                "Jam operasional: Senin-Jumat 08:00-16:00, Sabtu 08:00-12:00, Minggu tutup."
            ]
        },
        {
            "tag": "help",
            "patterns": ["help", "bantuan", "apa yang bisa", "fitur", "panduan"],
            "responses": [
                "Saya bisa membantu:\n• Mencari informasi buku\n• Memberikan lokasi rak\n• Info jam operasional\n• Layanan perpustakaan lainnya",
                "Fitur yang tersedia:\n- Pencarian buku\n- Informasi lokasi\n- Jam operasional\n- Bantuan umum perpustakaan"
            ]
        },
        {
            "tag": "thanks",
            "patterns": ["terima kasih", "thanks", "makasih", "thx"],
            "responses": [
                "Sama-sama! Senang bisa membantu.",
                "Dengan senang hati! Ada lagi yang bisa dibantu?",
                "Terima kasih kembali! Jangan sungkan bertanya lagi."
            ]
        },
        {
            "tag": "goodbye",
            "patterns": ["bye", "selamat tinggal", "sampai jumpa", "dadah"],
            "responses": [
                "Sampai jumpa! Semoga hari Anda menyenangkan.",
                "Selamat tinggal! Jangan lupa kembali ke perpustakaan.",
                "Bye! Terima kasih telah menggunakan layanan kami."
            ]
        }
    ]
}

# Sample book data (nanti bisa pindah ke database)
BOOKS_DATA = [
    {"title": "Pemrograman Python", "subject": "komputer", "location": "A1", "availability": "tersedia"},
    {"title": "Algoritma dan Struktur Data", "subject": "komputer", "location": "A1", "availability": "tersedia"},
    {"title": "Basis Data MySQL", "subject": "komputer", "location": "A2", "availability": "sedang dipinjam"},
    {"title": "Sejarah Indonesia", "subject": "sejarah", "location": "B1", "availability": "tersedia"},
    {"title": "Matematika Dasar", "subject": "matematika", "location": "C1", "availability": "tersedia"},
    {"title": "Fisika Modern", "subject": "fisika", "location": "C2", "availability": "tersedia"},
    {"title": "Bahasa Inggris", "subject": "bahasa", "location": "D1", "availability": "tersedia"},
    {"title": "Ekonomi Mikro", "subject": "ekonomi", "location": "E1", "availability": "sedang dipinjam"}
]

def clean_text(text):
    """Clean text for better matching"""
    return re.sub(r"[^\w\s]", "", text.lower()).strip()

def search_books_by_title(user_input):
    """Search books by title"""
    user_input_clean = user_input.lower()
    best_score = 0
    matched_book = None
    
    for book in BOOKS_DATA:
        score = fuzz.partial_ratio(user_input_clean, book['title'].lower())
        if score > best_score and score >= 70:
            best_score = score
            matched_book = book
    
    if matched_book:
        status = "tersedia" if matched_book['availability'] == 'tersedia' else "sedang dipinjam"
        return f"Buku \"{matched_book['title']}\" saat ini {status} (rak {matched_book['location']})", best_score
    
    return None, 0

def search_books_by_subject(user_input):
    """Search books by subject"""
    user_input_clean = user_input.lower()
    
    # Get all unique subjects
    subjects = list(set([book['subject'] for book in BOOKS_DATA]))
    matched_subject = None
    
    for subject in subjects:
        if subject in user_input_clean:
            matched_subject = subject
            break
    
    if matched_subject:
        # Find books with this subject that are available
        matching_books = [book for book in BOOKS_DATA 
                         if book['subject'] == matched_subject and book['availability'] == 'tersedia']
        
        if matching_books:
            location = matching_books[0]['location']
            total = len(matching_books)
            book_list = "\n".join([f"{i+1}. {book['title']}" for i, book in enumerate(matching_books)])
            return f"Ada {total} buku tentang {matched_subject} di rak {location}:\n{book_list}"
        else:
            return f"Maaf, belum ada buku {matched_subject} yang tersedia saat ini."
    
    return None

def find_best_match(user_input):
    """Find the best matching response"""
    user_input_clean = clean_text(user_input)
    
    # First, try to search for books by subject
    subject_response = search_books_by_subject(user_input)
    if subject_response:
        return subject_response, 100, "book_subject_search"
    
    # Then try to search by book title
    title_response, title_score = search_books_by_title(user_input)
    if title_response:
        return title_response, title_score, "book_title_search"
    
    # Finally, match with intents
    best_score = 0
    best_response = "Maaf, saya tidak mengerti maksud Anda. Ketik 'help' untuk melihat apa yang bisa saya bantu."
    best_pattern = ""
    
    for intent in INTENTS_DATA['intents']:
        for pattern in intent['patterns']:
            pattern_clean = clean_text(pattern)
            score1 = fuzz.partial_ratio(user_input_clean, pattern_clean)
            score2 = fuzz.token_sort_ratio(user_input_clean, pattern_clean)
            final_score = (score1 + score2) / 2
            
            if final_score > best_score:
                best_score = final_score
                best_response = random.choice(intent['responses'])
                best_pattern = pattern
    
    # Lower threshold for better user experience
    if best_score < 50:
        return "Maaf, saya tidak mengerti maksud Anda. Ketik 'help' untuk melihat apa yang bisa saya bantu.", best_score, ""
    
    return best_response, best_score, best_pattern

@app.route("/")
def home():
    """Home page"""
    return render_template("index.html")

@app.route("/get")
def get_bot_response():
    """Get bot response"""
    user_txt = request.args.get("msg", "").strip()
    
    if not user_txt:
        return jsonify({
            "response": "Mohon masukkan pesan Anda.",
            "score": 0,
            "pattern": ""
        })
    
    response, score, pattern = find_best_match(user_txt)
    
    return jsonify({
        "response": response,
        "score": score,
        "pattern": pattern
    })

@app.route("/health")
def health_check():
    """Health check endpoint"""
    return jsonify({
        "status": "OK",
        "message": "Chatbot Perpustakaan is running!",
        "intents_count": len(INTENTS_DATA['intents']),
        "books_count": len(BOOKS_DATA)
    })

if __name__ == "__main__":
    print("🚀 Starting Chatbot Perpustakaan...")
    print(f"📚 Loaded {len(INTENTS_DATA['intents'])} intents")
    print(f"📖 Loaded {len(BOOKS_DATA)} books")
    print("✅ Application ready!")
    
    port = int(os.environ.get("PORT", 5000))
    app.run(debug=False, host="0.0.0.0", port=port)