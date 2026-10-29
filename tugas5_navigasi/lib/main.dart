
import 'package:flutter/material.dart';
import 'detail_page.dart';

void main() {
  runApp(const MyApp());
}

const Color primaryColor = Color(0xFFE85D35);
const Color backgroundColor = Color(0xFFFFF9F5);

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Rasa Nusantara',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        scaffoldBackgroundColor: backgroundColor,
        colorScheme: ColorScheme.fromSeed(
          seedColor: primaryColor,
        ),
        appBarTheme: const AppBarTheme(
          backgroundColor: backgroundColor,
          foregroundColor: Color(0xFF292524),
        ),
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final TextEditingController searchController =
      TextEditingController();

  String selectedCategory = 'Semua';
  String searchQuery = '';

  final List<Map<String, dynamic>> foods = [
    {
      'id': 1,
      'name': 'Nasi Goreng Spesial',
      'category': 'Makanan Utama',
      'price': 25000,
      'rating': 4.9,
      'reviewCount': 128,
      'description':
          'Nasi goreng dengan bumbu rempah pilihan, '
          'telur, ayam, sayuran segar, dan kerupuk renyah. '
          'Dimasak langsung saat dipesan untuk menjaga '
          'rasa dan aromanya.',
      'imageUrl':
          'https://images.unsplash.com/photo-1603133872878-684f208fb84b?w=1000',
      'prepTime': '15-20 menit',
      'calories': '450 kkal',
      'portion': '1 porsi',
      'spicyLevel': 'Sedang',
      'availability': 'Tersedia',
      'ingredients': [
        'Nasi putih',
        'Telur ayam',
        'Daging ayam',
        'Bawang putih',
        'Kecap manis',
        'Sayuran segar',
      ],
    },
    {
      'id': 2,
      'name': 'Mie Ayam Bakso',
      'category': 'Makanan Utama',
      'price': 20000,
      'rating': 4.8,
      'reviewCount': 96,
      'description':
          'Mie kenyal dengan topping ayam berbumbu gurih, '
          'bakso sapi, sayuran, dan kuah kaldu hangat. '
          'Cocok dinikmati saat makan siang maupun malam.',
      'imageUrl':
          'https://images.unsplash.com/photo-1569718212165-3a8278d5f624?w=1000',
      'prepTime': '15 menit',
      'calories': '420 kkal',
      'portion': '1 mangkuk',
      'spicyLevel': 'Bisa disesuaikan',
      'availability': 'Tersedia',
      'ingredients': [
        'Mie telur',
        'Daging ayam',
        'Bakso sapi',
        'Sawi hijau',
        'Daun bawang',
        'Kaldu ayam',
      ],
    },
    {
      'id': 3,
      'name': 'Sate Ayam Madura',
      'category': 'Makanan Utama',
      'price': 30000,
      'rating': 4.9,
      'reviewCount': 154,
      'description':
          'Potongan ayam pilihan yang dibakar hingga harum, '
          'disajikan dengan saus kacang khas Madura, '
          'kecap manis, dan irisan bawang merah.',
      'imageUrl':
          'https://images.unsplash.com/photo-1529042410759-befb1204b468?w=1000',
      'prepTime': '20-25 menit',
      'calories': '500 kkal',
      'portion': '10 tusuk',
      'spicyLevel': 'Sedang',
      'availability': 'Tersedia',
      'ingredients': [
        'Daging ayam',
        'Kacang tanah',
        'Kecap manis',
        'Bawang merah',
        'Jeruk nipis',
        'Bumbu rempah',
      ],
    },
    {
      'id': 4,
      'name': 'Ayam Bakar Madu',
      'category': 'Makanan Utama',
      'price': 28000,
      'rating': 4.7,
      'reviewCount': 87,
      'description':
          'Ayam bakar berbumbu rempah dengan olesan madu '
          'yang menghasilkan perpaduan rasa manis dan gurih. '
          'Disajikan bersama nasi dan lalapan segar.',
      'imageUrl':
          'https://images.unsplash.com/photo-1532550907401-a500c9a57435?w=1000',
      'prepTime': '25 menit',
      'calories': '480 kkal',
      'portion': '1 potong',
      'spicyLevel': 'Tidak pedas',
      'availability': 'Tersedia',
      'ingredients': [
        'Daging ayam',
        'Madu',
        'Bawang putih',
        'Kecap manis',
        'Jahe',
        'Rempah pilihan',
      ],
    },
    {
      'id': 5,
      'name': 'Es Teh Manis',
      'category': 'Minuman',
      'price': 7000,
      'rating': 4.6,
      'reviewCount': 73,
      'description':
          'Minuman teh dengan perpaduan rasa manis '
          'dan kesegaran es batu. Pilihan sederhana '
          'untuk menemani hidangan favoritmu.',
      'imageUrl':
          'https://images.unsplash.com/photo-1556679343-c7306c1976bc?w=1000',
      'prepTime': '3 menit',
      'calories': '90 kkal',
      'portion': '1 gelas',
      'spicyLevel': 'Tidak pedas',
      'availability': 'Tersedia',
      'ingredients': [
        'Teh',
        'Air',
        'Gula',
        'Es batu',
      ],
    },
    {
      'id': 6,
      'name': 'Pisang Cokelat',
      'category': 'Camilan',
      'price': 12000,
      'rating': 4.8,
      'reviewCount': 65,
      'description':
          'Pisang manis berbalut kulit renyah dengan '
          'isian cokelat leleh. Cocok menjadi camilan '
          'santai bersama teman atau keluarga.',
      'imageUrl':
          'https://images.unsplash.com/photo-1482049016688-2d3e1b311543?w=1000',
      'prepTime': '10 menit',
      'calories': '280 kkal',
      'portion': '4 buah',
      'spicyLevel': 'Tidak pedas',
      'availability': 'Tersedia',
      'ingredients': [
        'Pisang',
        'Kulit lumpia',
        'Cokelat',
        'Susu kental manis',
      ],
    },
  ];

  final List<String> categories = [
    'Semua',
    'Makanan Utama',
    'Minuman',
    'Camilan',
  ];

  List<Map<String, dynamic>> get filteredFoods {
    return foods.where((food) {
      final matchesCategory = selectedCategory == 'Semua' ||
          food['category'] == selectedCategory;

      final matchesSearch = food['name']
          .toString()
          .toLowerCase()
          .contains(searchQuery.toLowerCase());

      return matchesCategory && matchesSearch;
    }).toList();
  }

  String formatPrice(int price) {
    final value = price.toString();
    final buffer = StringBuffer();

    for (int i = 0; i < value.length; i++) {
      buffer.write(value[i]);

      final remaining = value.length - i - 1;

      if (remaining > 0 && remaining % 3 == 0) {
        buffer.write('.');
      }
    }

    return 'Rp${buffer.toString()}';
  }

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final displayedFoods = filteredFoods;

    return Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            // Header aplikasi.
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(20, 20, 20, 10),
                child: Row(
                  children: [
                    Container(
                      width: 52,
                      height: 52,
                      decoration: BoxDecoration(
                        color: primaryColor,
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: const Icon(
                        Icons.restaurant_menu,
                        color: Colors.white,
                        size: 28,
                      ),
                    ),
                    const SizedBox(width: 12),
                    const Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Rasa Nusantara',
                            style: TextStyle(
                              fontSize: 21,
                              fontWeight: FontWeight.bold,
                              color: Color(0xFF292524),
                            ),
                          ),
                          SizedBox(height: 3),
                          Text(
                            'Nikmati lezatnya setiap hidangan',
                            style: TextStyle(
                              fontSize: 12,
                              color: Colors.black54,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(14),
                      ),
                      child: IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.shopping_bag_outlined,
                          color: primaryColor,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),

            // Banner sambutan.
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Container(
                  padding: const EdgeInsets.all(22),
                  decoration: BoxDecoration(
                    gradient: const LinearGradient(
                      colors: [
                        Color(0xFFE85D35),
                        Color(0xFFF49B56),
                      ],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                    borderRadius: BorderRadius.circular(24),
                  ),
                  child: Row(
                    children: [
                      const Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Lapar? Yuk, makan! 🍽️',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 21,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(height: 8),
                            Text(
                              'Temukan makanan favoritmu '
                              'dengan rasa yang istimewa.',
                              style: TextStyle(
                                color: Colors.white,
                                height: 1.5,
                                fontSize: 13,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(width: 8),
                      const Icon(
                        Icons.ramen_dining,
                        size: 64,
                        color: Colors.white,
                      ),
                    ],
                  ),
                ),
              ),
            ),

            // Kolom pencarian.
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: TextField(
                  controller: searchController,
                  onChanged: (value) {
                    setState(() {
                      searchQuery = value;
                    });
                  },
                  decoration: InputDecoration(
                    hintText: 'Cari nasi goreng, mie ayam...',
                    prefixIcon: const Icon(
                      Icons.search,
                      color: primaryColor,
                    ),
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16),
                      borderSide: BorderSide.none,
                    ),
                    contentPadding: const EdgeInsets.symmetric(
                      vertical: 16,
                    ),
                  ),
                ),
              ),
            ),

            // Kategori makanan.
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.only(
                  top: 24,
                  left: 20,
                  right: 20,
                  bottom: 18,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Kategori',
                      style: TextStyle(
                        fontSize: 19,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 12),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: categories.map((category) {
                          final isSelected =
                              selectedCategory == category;

                          return Padding(
                            padding: const EdgeInsets.only(right: 8),
                            child: ChoiceChip(
                              label: Text(category),
                              selected: isSelected,
                              showCheckmark: false,
                              selectedColor: primaryColor,
                              backgroundColor: Colors.white,
                              labelStyle: TextStyle(
                                color: isSelected
                                    ? Colors.white
                                    : const Color(0xFF57534E),
                                fontWeight: FontWeight.w600,
                              ),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(24),
                                side: BorderSide(
                                  color: isSelected
                                      ? primaryColor
                                      : Colors.transparent,
                                ),
                              ),
                              onSelected: (_) {
                                setState(() {
                                  selectedCategory = category;
                                });
                              },
                            ),
                          );
                        }).toList(),
                      ),
                    ),
                  ],
                ),
              ),
            ),

            // Judul daftar makanan.
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(20, 0, 20, 14),
                child: Row(
                  children: [
                    const Expanded(
                      child: Text(
                        'Menu Favorit',
                        style: TextStyle(
                          fontSize: 21,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF292524),
                        ),
                      ),
                    ),
                    Text(
                      '${displayedFoods.length} menu',
                      style: const TextStyle(
                        color: primaryColor,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ),
            ),

            // Daftar kartu makanan.
            if (displayedFoods.isEmpty)
              const SliverToBoxAdapter(
                child: Padding(
                  padding: EdgeInsets.all(40),
                  child: Column(
                    children: [
                      Icon(
                        Icons.search_off,
                        size: 60,
                        color: Colors.grey,
                      ),
                      SizedBox(height: 12),
                      Text(
                        'Makanan tidak ditemukan',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      SizedBox(height: 5),
                      Text('Coba kata kunci yang lain.'),
                    ],
                  ),
                ),
              )
            else
              SliverPadding(
                padding: const EdgeInsets.fromLTRB(20, 0, 20, 24),
                sliver: SliverList(
                  delegate: SliverChildBuilderDelegate(
                    (context, index) {
                      final food = displayedFoods[index];

                      return FoodCard(
                        food: food,
                        formattedPrice: formatPrice(food['price'] as int),
                        onTap: () {
                          // Navigasi ke halaman detail makanan.
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => DetailPage(
                                food: food,
                                formattedPrice:
                                    formatPrice(food['price'] as int),
                              ),
                            ),
                          );
                        },
                      );
                    },
                    childCount: displayedFoods.length,
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}

class FoodCard extends StatelessWidget {
  final Map<String, dynamic> food;
  final String formattedPrice;
  final VoidCallback onTap;

  const FoodCard({
    super.key,
    required this.food,
    required this.formattedPrice,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      elevation: 2,
      shadowColor: Colors.black.withValues(alpha: 0.04),
      margin: const EdgeInsets.only(bottom: 16),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        onTap: onTap,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                Image.network(
                  food['imageUrl'],
                  width: double.infinity,
                  height: 190,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) {
                    return Container(
                      height: 190,
                      width: double.infinity,
                      color: const Color(0xFFF1E7DE),
                      child: const Icon(
                        Icons.restaurant,
                        size: 60,
                        color: primaryColor,
                      ),
                    );
                  },
                ),
                Positioned(
                  top: 12,
                  left: 12,
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 7,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Text(
                      food['category'],
                      style: const TextStyle(
                        fontSize: 11,
                        fontWeight: FontWeight.bold,
                        color: primaryColor,
                      ),
                    ),
                  ),
                ),
                Positioned(
                  bottom: 12,
                  right: 12,
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 10,
                      vertical: 7,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Row(
                      children: [
                        const Icon(
                          Icons.star,
                          size: 16,
                          color: Color(0xFFFFB300),
                        ),
                        const SizedBox(width: 4),
                        Text(
                          '${food['rating']}',
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    food['name'],
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF292524),
                    ),
                  ),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      const Icon(
                        Icons.schedule,
                        size: 15,
                        color: Colors.black54,
                      ),
                      const SizedBox(width: 5),
                      Expanded(
                        child: Text(
                          food['prepTime'],
                          style: const TextStyle(
                            fontSize: 12,
                            color: Colors.black54,
                          ),
                        ),
                      ),
                      Text(
                        '$formattedPrice',
                        style: const TextStyle(
                          fontSize: 17,
                          color: primaryColor,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 14),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: onTap,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: primaryColor,
                        foregroundColor: Colors.white,
                        elevation: 0,
                        padding: const EdgeInsets.symmetric(vertical: 13),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      child: const Text(
                        'Lihat Detail Makanan',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
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
