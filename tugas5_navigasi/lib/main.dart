import 'package:flutter/material.dart';
import 'detail_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Katalog Produk',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF3157D5)),
        scaffoldBackgroundColor: const Color(0xFFF5F7FC),
        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xFF3157D5),
          foregroundColor: Colors.white,
          centerTitle: false,
        ),
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    // Daftar produk beserta gambar dan deskripsinya.
    final List<Map<String, String>> products = [
      {
        'title': 'Laptop Pro',
        'category': 'Laptop',
        'price': 'Rp12.500.000',
        'description':
            'Laptop untuk menunjang pekerjaan, kuliah, '
            'multitasking, dan kebutuhan produktivitas sehari-hari.',
        'imageUrl':
            'https://images.unsplash.com/photo-1496181133206-80ce9b88a853?w=800',
      },
      {
        'title': 'Smartphone X',
        'category': 'Smartphone',
        'price': 'Rp4.500.000',
        'description':
            'Smartphone dengan desain modern yang cocok untuk '
            'komunikasi, belajar, fotografi, dan hiburan.',
        'imageUrl':
            'https://images.unsplash.com/photo-1511707171634-5f897ff02aa9?w=800',
      },
      {
        'title': 'Headphone Air',
        'category': 'Audio',
        'price': 'Rp750.000',
        'description':
            'Headphone untuk mendengarkan musik, menonton video, '
            'dan mengikuti kelas online.',
        'imageUrl':
            'https://images.unsplash.com/photo-1505740420928-5e560c06d30e?w=800',
      },
      {
        'title': 'Samsung Galaxy A56',
        'category': 'Smartphone Samsung',
        'price': 'Rp5.999.000',
        'description':
            'Smartphone untuk penggunaan sehari-hari, menikmati '
            'konten, dan menjalankan berbagai aplikasi.',
        'imageUrl':
            'https://images.unsplash.com/photo-1592899677977-9c10ca588bbd?w=800',
      },
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Katalog Produk',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                colors: [Color(0xFF3157D5), Color(0xFF6687F5)],
              ),
              borderRadius: BorderRadius.circular(20),
            ),
            child: const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Icon(
                  Icons.shopping_bag_outlined,
                  color: Colors.white,
                  size: 36,
                ),
                SizedBox(height: 12),
                Text(
                  'Temukan Produk Favoritmu',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 21,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 6),
                Text(
                  'Pilih produk untuk melihat gambar dan '
                  'informasi lengkapnya.',
                  style: TextStyle(color: Colors.white, fontSize: 14),
                ),
              ],
            ),
          ),

          const SizedBox(height: 24),

          const Text(
            'Daftar Produk',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),

          const SizedBox(height: 12),

          // Menampilkan seluruh produk.
          ...products.map((product) {
            return Card(
              elevation: 1,
              color: Colors.white,
              margin: const EdgeInsets.only(bottom: 12),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              clipBehavior: Clip.antiAlias,
              child: ListTile(
                contentPadding: const EdgeInsets.all(10),
                leading: ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Image.network(
                    product['imageUrl']!,
                    width: 76,
                    height: 76,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) {
                      return Container(
                        width: 76,
                        height: 76,
                        color: Colors.grey.shade200,
                        child: const Icon(Icons.image_not_supported_outlined),
                      );
                    },
                  ),
                ),
                title: Text(
                  product['title']!,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                  ),
                ),
                subtitle: Padding(
                  padding: const EdgeInsets.only(top: 5),
                  child: Text(product['category']!),
                ),
                trailing: const Icon(
                  Icons.arrow_forward_ios,
                  size: 18,
                  color: Color(0xFF3157D5),
                ),

                // Navigasi tetap mengikuti materi.
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => DetailPage(
                        itemTitle: product['title']!,
                        description: product['description']!,
                        imageUrl: product['imageUrl']!,
                        category: product['category']!,
                        price: product['price']!,
                      ),
                    ),
                  );
                },
              ),
            );
          }),
        ],
      ),
    );
  }
}
