import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mobileuts/model/food_model.dart';
import 'package:mobileuts/pages/food_detile_page.dart';
import '../services/food_service.dart';

class FoodListPage extends StatefulWidget {
  const FoodListPage({super.key});

  @override
  State<FoodListPage> createState() => _FoodListPageState();
}

class _FoodListPageState extends State<FoodListPage> {
  List<Food> foods = [];
  final Color primaryColor = Colors.orange.shade700;

  // ===== Penambahan State untuk Pencarian =====
  bool isSearching = false; // State untuk mengontrol tampilan search bar
  String searchQuery = ""; // Menyimpan teks pencarian
  // ===========================================

  @override
  void initState() {
    super.initState();
    loadData();
  }

  Future<void> loadData() async {
    try {
      final data = await FoodService.fetchFoods();
      setState(() {
        foods = data;
      });
    } catch (e) {
      print("Error loading data: $e");
    }
  }

  // ===== Penambahan Filter Logic =====
  List<Food> get filteredFoods {
    if (searchQuery.isEmpty) {
      return foods;
    }
    // Filter berdasarkan nama atau deskripsi (case-insensitive)
    return foods.where((food) {
      final nameLower = food.name.toLowerCase();
      final descLower = food.description.toLowerCase();
      final searchLower = searchQuery.toLowerCase();

      return nameLower.contains(searchLower) || descLower.contains(searchLower);
    }).toList();
  }
  // ===================================

  // Widget untuk menampilkan setiap item makanan dengan desain yang diperbagus
  Widget _buildFoodItem(Food food) {
    return GestureDetector(
      onTap: () async {
        // Asumsi FoodDetailPage sudah diperbaiki menjadi FoodDetailPage
        await Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => FoodDetailPage(food: food)),
        );
        loadData();
      },
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.15),
              spreadRadius: 1,
              blurRadius: 7,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: ListTile(
          leading: ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.network(
              food.image,
              width: 70,
              height: 70,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) {
                return Container(
                  width: 70,
                  height: 70,
                  decoration: BoxDecoration(
                    color: Colors.grey[200],
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Icon(
                    Icons.image_not_supported,
                    color: Colors.grey[500],
                    size: 30,
                  ),
                );
              },
            ),
          ),
          title: Text(
            food.name,
            style: GoogleFonts.poppins(
              fontWeight: FontWeight.w700,
              fontSize: 16,
              color: Colors.black87,
            ),
          ),
          subtitle: Text(
            // Tampilkan deskripsi dan harga
            "Rp ${food.harga} | ${food.description.length > 30 ? food.description.substring(0, 30) + '...' : food.description}",
            style: GoogleFonts.poppins(color: Colors.grey[600], fontSize: 12),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          trailing: Icon(Icons.chevron_right, size: 24, color: primaryColor),
        ),
      ),
    );
  }

  // ===== Widget AppBar Pencarian (Search Bar) =====
  Widget _buildSearchAppBar() {
    return AppBar(
      backgroundColor: primaryColor,
      iconTheme: const IconThemeData(color: Colors.white),
      leading: IconButton(
        icon: const Icon(Icons.arrow_back, color: Colors.white),
        onPressed: () {
          setState(() {
            isSearching = false;
            searchQuery = ""; // Reset query saat keluar dari mode search
          });
        },
      ),
      title: TextField(
        autofocus: true,
        style: GoogleFonts.poppins(color: Colors.white, fontSize: 18),
        cursorColor: Colors.white,
        decoration: InputDecoration(
          hintText: "Cari makanan...",
          hintStyle: GoogleFonts.poppins(color: Colors.white70),
          border: InputBorder.none,
          // Menghilangkan underline/border bawaan
        ),
        onChanged: (query) => setState(() => searchQuery = query),
      ),
      actions: [
        IconButton(
          icon: const Icon(Icons.clear, color: Colors.white),
          onPressed: () {
            setState(() {
              searchQuery = ""; // Clear search query
              // Secara opsional, keluar dari mode search:
              isSearching = false;
            });
          },
        ),
      ],
    );
  }
  // ================================================

  // ===== Widget AppBar Default =====
  Widget _buildDefaultAppBar() {
    return AppBar(
      title: Text(
        "Daftar Makanan",
        style: GoogleFonts.poppins(
          fontWeight: FontWeight.w600,
          color: Colors.white,
        ),
      ),
      backgroundColor: primaryColor,
      elevation: 4,
      iconTheme: const IconThemeData(color: Colors.white),
      actions: [
        IconButton(
          icon: const Icon(Icons.search, color: Colors.white),
          onPressed: () {
            setState(() {
              isSearching = true; // Masuk ke mode search
            });
          },
        ),
        IconButton(
          icon: const Icon(Icons.refresh, color: Colors.white),
          onPressed: loadData,
        ),
      ],
    );
  }
  // =================================

  @override
  Widget build(BuildContext context) {
    // Tentukan list mana yang akan ditampilkan (filterFoods atau foods jika tidak search)
    final displayFoods = filteredFoods;

    return Scaffold(
      backgroundColor: Colors.grey[50],
      // Menggunakan AppBar dinamis
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(kToolbarHeight),
        child: isSearching ? _buildSearchAppBar() : _buildDefaultAppBar(),
      ),

      body: foods.isEmpty
          ? Center(child: Text("Data Kosong", style: GoogleFonts.poppins(color: Colors.grey) ))
          : RefreshIndicator(
              onRefresh: loadData,
              color: primaryColor,
              child: displayFoods.isEmpty && searchQuery.isNotEmpty
                  ? Center(
                      child: Text(
                        "Tidak ada makanan yang cocok dengan '${searchQuery}'",
                        style: GoogleFonts.poppins(color: Colors.grey),
                      ),
                    )
                  : ListView.builder(
                      itemCount: displayFoods.length,
                      itemBuilder: (context, index) {
                        final food = displayFoods[index];
                        return _buildFoodItem(food);
                      },
                    ),
            ),
    );
  }
}
