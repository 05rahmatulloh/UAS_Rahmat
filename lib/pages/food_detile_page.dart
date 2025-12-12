import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mobileuts/model/food_model.dart';
import 'package:mobileuts/services/food_service.dart';

class FoodDetailPage extends StatelessWidget {
  final Food food;
  const FoodDetailPage({super.key, required this.food});

  final Color primaryColor = Colors.orange;

  Future<void> deleteFood(BuildContext context) async {
    await FoodService.deleteFood(food.id); // hapus berdasarkan index id
    Navigator.pop(context); // kembali
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50],

      appBar: AppBar(
        title: Text(
          food.name,
          style: GoogleFonts.poppins(
            fontWeight: FontWeight.w600,
            color: Colors.white,
          ),
        ),
        backgroundColor: primaryColor,
        elevation: 4,
        iconTheme: const IconThemeData(color: Colors.white),

        // 🔥 Tombol Hapus di AppBar
        actions: [
          IconButton(
            icon: const Icon(Icons.delete, color: Colors.white),
            onPressed: () {
              showDialog(
                context: context,
                builder: (ctx) {
                  return AlertDialog(
                    title: const Text("Hapus Data?"),
                    content: Text(
                      "Apakah kamu yakin ingin menghapus makanan '${food.name}'?",
                      style: GoogleFonts.poppins(),
                    ),
                    actions: [
                      TextButton(
                        child: const Text("Batal"),
                        onPressed: () => Navigator.pop(ctx),
                      ),
                      TextButton(
                        child: const Text(
                          "Hapus",
                          style: TextStyle(color: Colors.red),
                        ),
                        onPressed: () async {
                          Navigator.pop(ctx); // tutup dialog
                          await deleteFood(context);
                        },
                      ),
                    ],
                  );
                },
              );
            },
          ),
        ],
      ),

      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Gambar
            Container(
              height: 280,
              width: double.infinity,
              color: Colors.grey[200],
              child: Image.network(
                food.image,
                width: double.infinity,
                height: 250,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) {
                  return Center(
                    child: Icon(
                      Icons.broken_image,
                      size: 50,
                      color: Colors.grey[600],
                    ),
                  );
                },
              ),
            ),

            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Nama Makanan
                  Text(
                    food.name,
                    style: GoogleFonts.poppins(
                      fontSize: 28,
                      fontWeight: FontWeight.w800,
                      color: Colors.black87,
                    ),
                  ),

                  const SizedBox(height: 10),

                  // Harga
                  Text(
                    "Harga: Rp ${food.harga}",
                    style: GoogleFonts.poppins(
                      fontSize: 22,
                      fontWeight: FontWeight.w700,
                      color: Colors.green.shade700,
                    ),
                  ),

                  const Divider(height: 30, thickness: 1),

                  // Deskripsi Title
                  Text(
                    "Deskripsi",
                    style: GoogleFonts.poppins(
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                      color: primaryColor,
                    ),
                  ),

                  const SizedBox(height: 8),

                  // Deskripsi
                  Text(
                    food.description,
                    style: GoogleFonts.poppins(
                      fontSize: 16,
                      height: 1.5,
                      color: Colors.grey[800],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
