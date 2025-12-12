import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mobileuts/model/food_model.dart';
import 'package:mobileuts/services/food_service.dart';

class FoodFormPage extends StatefulWidget {
  const FoodFormPage({super.key});

  @override
  State<FoodFormPage> createState() => _FoodFormPageState();
}

class _FoodFormPageState extends State<FoodFormPage> {
  final TextEditingController idController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController imageController = TextEditingController();
  final TextEditingController hargaController = TextEditingController();
  final TextEditingController descController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  final FoodService foodService = Get.put(FoodService());

  final Color primaryColor = Colors.orange.shade700;

  InputDecoration _buildInputDecoration(String label) {
    return InputDecoration(
      labelText: label,
      labelStyle: GoogleFonts.poppins(color: Colors.grey.shade600),
      floatingLabelStyle: GoogleFonts.poppins(
        color: primaryColor,
        fontWeight: FontWeight.w600,
      ),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: BorderSide(color: Colors.grey.shade300),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: BorderSide(color: primaryColor, width: 2),
      ),
      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50],
      appBar: AppBar(
        title: Text(
          "Tambah Food",
          style: GoogleFonts.poppins(
            fontWeight: FontWeight.w700,
            color: Colors.white,
          ),
        ),
        backgroundColor: primaryColor,
        iconTheme: const IconThemeData(color: Colors.white),
        elevation: 4,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              // ============================
              // ID
              // ============================
              TextFormField(
                controller: idController,
                keyboardType: TextInputType.number,
                decoration: _buildInputDecoration("ID Produk"),
                style: GoogleFonts.poppins(),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "ID tidak boleh kosong";
                  }
                  if (int.tryParse(value) == null) {
                    return "ID harus angka";
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),

              // ============================
              // Nama
              // ============================
              TextFormField(
                controller: nameController,
                decoration: _buildInputDecoration("Nama Makanan"),
                style: GoogleFonts.poppins(),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Nama tidak boleh kosong";
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),

              // ============================
              // Harga
              // ============================
              TextFormField(
                controller: hargaController,
                keyboardType: TextInputType.number,
                decoration: _buildInputDecoration("Harga Makanan"),
                style: GoogleFonts.poppins(),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Harga tidak boleh kosong";
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),

              // ============================
              // URL Gambar
              // ============================
              TextFormField(
                controller: imageController,
                decoration: _buildInputDecoration("URL Gambar (Opsional)"),
                style: GoogleFonts.poppins(),
              ),
              const SizedBox(height: 16),

              // ============================
              // Deskripsi
              // ============================
              TextFormField(
                controller: descController,
                maxLines: 4,
                decoration: _buildInputDecoration("Deskripsi Makanan"),
                style: GoogleFonts.poppins(),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Deskripsi tidak boleh kosong";
                  }
                  return null;
                },
              ),

              const SizedBox(height: 30),

              // ============================
              // TOMBOL SIMPAN
              // ============================
              ElevatedButton(
                onPressed: () async {
                  if (_formKey.currentState!.validate()) {
                    // Membuat object Food dari FORM user
                    Food newFood = Food(
                      id: int.parse(idController.text),
                      name: nameController.text,
                      image: imageController.text,
                      harga: hargaController.text,
                      description: descController.text,
                      firebaseKey: null,
                    );

                    await foodService.setFood(newFood);

                    Get.back();
                  }
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: primaryColor,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: Text(
                  "Simpan",
                  style: GoogleFonts.poppins(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
