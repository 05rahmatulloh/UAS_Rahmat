# 🍔 Food Explorer App

Aplikasi ini dibuat untuk memenuhi **Ujian Tengah Semester (UTS)** mata kuliah **Mobile Programming**.  
Proyek ini menampilkan daftar makanan dengan data yang diambil dari file **JSON lokal**, dilengkapi dengan navigasi antar halaman dan desain antarmuka yang responsif.

---

## 👤 Identitas Mahasiswa
- **Nama:** RAHMATULLOH  
- **NIM:** 240605110042
- **Kelas:** kelas B  
- **Mata Kuliah:** Mobile Programming  
- **Dosen Pengampu:** A'LA SYAUQI,M.Kom

---

## 🎯 Tujuan Aplikasi
Menerapkan konsep **widget, layout, navigasi, dan pengolahan data JSON** di Flutter, sesuai dengan ketentuan ujian UTS:
- Minimal 3 halaman yang saling terhubung
- Data diambil dari JSON lokal
- Desain clean, responsif, dan mudah dikembangkan

---

## 🧩 Fitur Aplikasi
| Fitur | Deskripsi |
|-------|------------|
| 🏠 **Home Page** | Halaman utama dengan tombol navigasi ke daftar makanan |
| 📜 **Food List Page** | Menampilkan daftar makanan dari file JSON |
| 🍕 **Food Detail Page** | Menampilkan detail makanan yang dipilih (gambar & deskripsi) |
| 💾 **Data Lokal JSON** | Data makanan diambil dari file `assets/data/foods.json` |
| 🎨 **Desain Modern** | Menggunakan Google Fonts dan warna oranye sebagai tema utama |

---

## 🧱 Struktur Folder


lib/
│
├── main.dart
├── models/
│ └── food_model.dart
├── pages/
│ ├── home_page.dart
│ ├── food_list_page.dart
│ └── food_detail_page.dart
└── services/
└── food_service.dart
assets/
└── data/
└── foods.json


---

## 🗂️ Data JSON (`assets/data/foods.json`)
```json
[
  {
    "id": 1,
    "name": "Burger",
    "image": "https://images.unsplash.com/photo-1550547660-d9450f859349?w=600",
    "description": "Burger lezat dengan daging sapi premium, keju leleh, dan sayuran segar."
  },
  {
    "id": 2,
    "name": "Drink",
    "image": "https://images.unsplash.com/photo-1504674900247-0877df9cc836?auto=format&fit=crop&w=600&q=80",
    "description": "Minuman segar untuk menemani waktu santai Anda."
  },
  {
    "id": 3,
    "name": "Pasta",
    "image": "https://images.unsplash.com/photo-1529042410759-befb1204b468?w=600",
    "description": "Pasta creamy dengan saus carbonara dan taburan keju parmesan."
  }
]

