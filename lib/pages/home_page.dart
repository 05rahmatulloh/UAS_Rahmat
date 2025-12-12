import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mobileuts/pages/formpage.dart';
import 'food_list_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    // Tentukan tema warna utama
    const Color primaryColor = Colors.orange;
    const Color accentColor = Color.fromARGB(
      255,
      255,
      165,
      0,
    ); // Oranye yang lebih cerah

    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Food Explorer",
          style: GoogleFonts.poppins(
            fontWeight: FontWeight.w700,
            color: Colors.white,
          ),
        ),
        backgroundColor: primaryColor,
        elevation: 0, // Hapus bayangan AppBar
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // --- Bagian Header/Visual Utama ---
              const SizedBox(height: 30),

              // Elemen Visual yang Lebih Menarik (bisa diganti dengan Image.asset jika ada)
              Center(
                child: Container(
                  width: 150,
                  height: 150,
                  decoration: BoxDecoration(
                    color: primaryColor.withOpacity(0.1),
                    shape: BoxShape.circle,
                    border: Border.all(color: primaryColor, width: 3),
                  ),
                  child: const Icon(
                    Icons.restaurant_menu,
                    color: primaryColor,
                    size: 80,
                  ),
                ),
              ),

              const SizedBox(height: 40),

              // --- Teks Sambutan ---
              Text(
                "Selamat Datang di Food Explorer!",
                style: GoogleFonts.poppins(
                  fontSize: 24,
                  fontWeight: FontWeight.w800,
                  color: Colors.black87,
                ),
                textAlign: TextAlign.center,
              ),

              const SizedBox(height: 10),

              Text(
                "Jelajahi dan kelola semua data makanan favorit Anda dengan mudah.",
                style: GoogleFonts.poppins(fontSize: 16, color: Colors.black54),
                textAlign: TextAlign.center,
              ),

              const SizedBox(height: 60),

              // --- Tombol Utama (Dipertegas) ---
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.white,
                  backgroundColor: primaryColor,
                  padding: const EdgeInsets.symmetric(vertical: 18),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  elevation: 5, // Tambahkan sedikit bayangan untuk efek 3D
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>  FoodListPage(),
                    ),
                  );
                },
                child: Text(
                  "Lihat Daftar Makanan",
                  style: GoogleFonts.poppins(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),

              const SizedBox(height: 20),

              // --- Tombol Sekunder (Dibuat sebagai TextButton atau OutlinedButton) ---
              OutlinedButton.icon(
                icon: const Icon(Icons.add, color: primaryColor),
                label: Text(
                  "Tambah Makanan Baru",
                  style: GoogleFonts.poppins(color: primaryColor),
                ),
                style: OutlinedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 18),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  side: const BorderSide(color: primaryColor, width: 2),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const FoodFormPage(),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
      // Menghapus FloatingActionButton karena fungsinya sudah digantikan OutlinedButton di Body
      // Jika Anda tetap ingin menggunakannya, Anda bisa menghapus OutlinedButton di atas.
      // floatingActionButton: FloatingActionButton(
      //   onPressed: () {
      //     Navigator.push(
      //       context,
      //       MaterialPageRoute(builder: (context) => const FoodFormPage()),
      //     );
      //   },
      //   backgroundColor: Colors.blue,
      //   child: const Icon(Icons.add, color: Colors.white),
      // ),
    );
  }
}
