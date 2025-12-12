class Food {
  final int id;
  final String name;
  final String image;
  final String description;
  final String harga;
  // 1. Tambahkan properti final untuk menyimpan Firebase Key (Opsional karena saat create, key belum ada)
  final String? firebaseKey;

  Food({
    required this.id,
    required this.name,
    required this.image,
    required this.harga,
    required this.description,
    // 2. Gunakan this.firebaseKey di constructor, menjadikannya opsional (null-safe)
    this.firebaseKey,
  });

  // 3. Sesuaikan factory constructor untuk menerima optional key
  factory Food.fromJson(Map<String, dynamic> json, [String? key]) {
    final String parsedDescription =
        json['description'] ?? json['descripsi'] ?? '';

    return Food(
      id: json['id'] as int? ?? 0,
      name: json['name'] as String? ?? '',
      image: json['image'] as String? ?? '',
      harga: json['harga'] as String? ?? '',
      description: parsedDescription,
      // Meneruskan key yang diterima (jika ada)
      // firebaseKey: key,
    );
  }
}
// Catatan: Anda tidak lagi membutuhkan 'get firebaseKey => null;' karena sudah didefinisikan sebagai properti kelas.