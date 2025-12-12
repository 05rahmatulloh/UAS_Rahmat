# 🍔 Food App — Flutter CRUD Application

Aplikasi ini dibuat berdasarkan project Flutter yang kamu kirim, yaitu aplikasi **CRUD sederhana** yang menampilkan daftar makanan, melihat detail makanan, serta menambah/mengedit/menghapus data menggunakan **service public dan Firebase rtdb**.
Aplikasi **tidak menggunakan JSON lokal**, tetapi menggunakan **class model + service** sebagai penyimpanan data sementara di memori.

---

## 👤 Identitas Mahasiswa

* **Nama:** RAHMATULLOH
* **NIM:** 240605110042
* **Kelas:** B
* **Mata Kuliah:** Mobile Programming
* **Dosen Pengampu:** A'LA SYAUQI, M.Kom

---

## 🎯 Tujuan Pembuatan Aplikasi

Tujuan pembuatan aplikasi ini adalah:

* Mengimplementasikan **CRUD (Create, Read, Update, Delete)** di Flutter.
* Menerapkan navigasi antar halaman.
* Memahami penggunaan **Model, Services, dan UI Pages**.
* Membuat aplikasi dengan desain yang rapi dan mudah dikembangkan.

Aplikasi terdiri dari halaman:

1. **Home Page**
2. **Food List Page** (menampilkan daftar)
3. **Food Detail Page** (detail item)
4. **Form Page** (tambah & edit)

---

## 🧩 Fitur Utama Aplikasi

| Fitur                   | Deskripsi                                     |
| ----------------------- | --------------------------------------------- |
| 🏠 **Home Page**        | Halaman awal aplikasi                         |
| 📜 **Food List Page**   | Menampilkan daftar makanan dari service lokal |
| 🍕 **Food Detail Page** | Menampilkan detail makanan (nama & deskripsi) |
| 📝 **Form Page**        | Untuk menambah dan mengedit data makanan      |
| ❌ **Delete**            | Hapus data makanan langsung dari list         |
| ⚡ **CRUD Lengkap**      | Semua data dikelola lewat `FoodService`       |
| 🧱 **Arsitektur Rapi**  | Model — Service — Pages                       |

---

## 🧱 Struktur Folder

Struktur project sesuai isi ZIP kamu:

```
lib/
├── firebase_options.dart
├── main.dart
├── model/
│   └── food_model.dart
├── pages/
│   ├── food_detile_page.dart
│   ├── food_list_page.dart
│   ├── formpage.dart
│   └── home_page.dart
└── services/
    └── food_service.dart
```

---

## 📘 Penjelasan Setiap Folder & File

### 📌 1. `model/food_model.dart`

Berisi struktur data makanan:

* id
* nama makanan
* deskripsi
* harga (opsional jika ada)

Digunakan sebagai objek utama aplikasi.

### 📌 2. `services/food_service.dart`

Mengelola seluruh proses CRUD:

* `getAllFoods()` → mengambil semua data
* `addFood()` → menambah makanan baru
* `updateFood()` → mengubah data makanan
* `deleteFood()` → menghapus makanan

Service menggunakan **List lokal** sebagai database sementara.

### 📌 3. Halaman (`pages/`)

#### 🏠 Home Page (`home_page.dart`)

* Menampilkan menu menuju halaman daftar makanan.

#### 📜 Food List Page (`food_list_page.dart`)

* Menampilkan daftar makanan menggunakan **ListView.builder**.
* Terdapat tombol:

  * ➕ Tambah data
  * 🗑 Hapus data
  * ✏️ Edit data
  * 👉 Klik item untuk membuka detail

#### 🍕 Food Detail Page (`food_detile_page.dart`)

* Menampilkan:

  * Nama makanan
  * Deskripsi
  * Informasi tambahan lain jika ada

#### 📝 Form Page (`formpage.dart`)

* Form input untuk:

  * Nama makanan
  * Deskripsi makanan
* Digunakan untuk **tambah** dan **edit**.

---

## 🔄 Alur Kerja Aplikasi

1. Aplikasi dibuka → Home Page.
2. Pengguna masuk ke **Food List Page**.
3. Pengguna bisa:

   * Menambah data → Form Page
   * Mengedit data → Form Page
   * Menghapus data → langsung dari List
   * Melihat detail → Detail Page
4. Semua perubahan akan tersimpan dalam **FoodService**.

---

## ▶️ Cara Menjalankan

```bash
flutter pub get
flutter run
```

---

## 🔥 Integrasi Firebase Realtime Database

Aplikasi ini juga dapat menggunakan **Firebase Realtime Database** sebagai sumber data eksternal.
Saat ini, aplikasi terhubung ke URL Firebase berikut:

```
https://coba1-5f863-default-rtdb.asia-southeast1.firebasedatabase.app/UAS/.json
```

### 📌 Fungsi URL tersebut

* URL ini berisi **data makanan** yang digunakan aplikasi.
* Format yang dikembalikan adalah **JSON** langsung dari Firebase.
* Data dapat dimuat menggunakan HTTP GET atau package seperti `http` atau `firebase_database`.

### 📌 Keuntungan Menggunakan Firebase

* Data tersimpan di cloud dan bisa diakses banyak perangkat.
* Update data **real-time**.
* Cocok untuk aplikasi yang ingin online.

Jika aplikasi menggunakan Firebase sepenuhnya, maka:

* `FoodService` dapat diganti menjadi service berbasis HTTP GET/POST.
* CRUD bisa dilakukan langsung pada database Firebase.
* Data akan tersinkron otomatis.

---

## 🚀 Saran Pengembangan

Beberapa pengembangan yang bisa dilakukan:

* Menyimpan data ke Firebase Firestore.
* Menambahkan gambar makanan.
* Menggunakan state management (Provider/GetX/Riverpod).
* Menambahkan tampilan UI lebih modern.
* Menambahkan validasi input pada Form.

---


