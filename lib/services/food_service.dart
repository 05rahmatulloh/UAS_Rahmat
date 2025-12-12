import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:mobileuts/model/food_model.dart';
import 'package:firebase_database/firebase_database.dart';


class FoodService extends GetxController {
  final DatabaseReference db = FirebaseDatabase.instance.ref();

  static const String baseUrl =
      'https://coba1-5f863-default-rtdb.asia-southeast1.firebasedatabase.app/UAS/makanan/.json';
static Future<List<Food>> fetchFoods() async {
    print("=== FETCH FOOD PROCESS START ===");

    try {
      print("[1] Membuat request ke Firebase...");
      final response = await http.get(Uri.parse(baseUrl));

      print("[2] Response diterima dengan status code: ${response.statusCode}");

      if (response.statusCode == 200) {
        print("[3] Decode JSON...");

        final dynamic raw = json.decode(response.body);

        print("[4] Deteksi tipe data...");
        print("Tipe data yang diterima: ${raw.runtimeType}");

        List<Food> foods = [];

        // CASE MAP
        if (raw is Map<String, dynamic>) {
          print("[5] Format MAP terdeteksi, mapping Map...");

          raw.forEach((key, value) {
            if (value is Map<String, dynamic>) {
              foods.add(Food.fromJson(value));
            } else {
              print(
                "[WARNING] Skip key '$key' karena value bukan MAP (value tipe: ${value.runtimeType})",
              );
            }
          });
        }
        // CASE LIST
        else if (raw is List<dynamic>) {
          print("[5] Format LIST terdeteksi, mapping List...");
          for (var item in raw) {
            if (item is Map<String, dynamic>) {
              foods.add(Food.fromJson(item));
            }
          }
        }

        print("[6] Mapping selesai. Total data: ${foods.length}");
        print("=== FETCH FOOD PROCESS SUCCESS ===");

        return foods;
      } else {
        print("[ERROR] Status code: ${response.statusCode}");
        return [];
      }
    } catch (e) {
      print("[EXCEPTION] Error fetching foods: $e");
      return [];
    }
  }

  
  







   Future<void> setFood(Food food) async {
    try {
      await db.child("UAS/makanan/${food.id}").set({
        "id": food.id,
        "name": food.name,
        "image": food.image,
        "description": food.description,
        "harga": food.harga,

      });

      print("[SET] Data berhasil disimpan ke Firebase");
    } catch (e) {
      print("[SET ERROR] $e");
    }
  }

 
  static Future<void> deleteFood(int index) async {
    // Ambil semua data dulu
    final response = await http.get(Uri.parse(baseUrl));
    final List<dynamic> list = json.decode(response.body);

    // Hapus index
    list.removeAt(index);

    // Tulis ulang seluruh data
    await http.put(Uri.parse(baseUrl), body: json.encode(list));
  }

  
  }
