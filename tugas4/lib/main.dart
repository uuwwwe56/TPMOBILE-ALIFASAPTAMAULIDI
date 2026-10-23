import 'package:flutter/material.dart';
import 'article_model.dart';
import 'api_service.dart';

void main() {
  runApp(const NewsApp());
}

// ==================== WARNA APLIKASI ====================
const Color primaryBlue = Color(0xFF1769FF);
const Color darkBlue = Color(0xFF123B78);
const Color backgroundColor = Color(0xFFF4F7FC);

// ==================== APLIKASI UTAMA ====================
class NewsApp extends StatelessWidget {
  const NewsApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'NewsDaily',
      theme: ThemeData(
        useMaterial3: true,
        scaffoldBackgroundColor: backgroundColor,
        colorScheme: ColorScheme.fromSeed(seedColor: primaryBlue),
        appBarTheme: const AppBarTheme(
          backgroundColor: backgroundColor,
          foregroundColor: darkBlue,
          elevation: 0,
        ),
      ),
      home: const NewsScreen(),
    );
  }
}

// ==================== HALAMAN BERITA ====================
class NewsScreen extends StatefulWidget {
  const NewsScreen({super.key});

  @override
  State<NewsScreen> createState() => _NewsScreenState();
}

class _NewsScreenState extends State<NewsScreen> {
  late Future<List<Article>> _articlesFuture;

  final ScrollController _scrollController = ScrollController();

  bool _showBackToTop = false;

  @override
  void initState() {
    super.initState();

    _articlesFuture = ApiService().fetchArticles();
    _scrollController.addListener(_handleScroll);
  }

  // Memunculkan tombol kembali ke atas saat scroll
  void _handleScroll() {
    final showButton =
        _scrollController.hasClients && _scrollController.offset > 300;

    if (showButton != _showBackToTop) {
      setState(() {
        _showBackToTop = showButton;
      });
    }
  }

  // ==================== PULL TO REFRESH ====================
  Future<void> _refreshArticles() async {
    final newFuture = ApiService().fetchArticles();

    setState(() {
      _articlesFuture = newFuture;
    });

    try {
      await newFuture;
    } catch (_) {
      // Pesan error ditampilkan oleh FutureBuilder
    }
  }

  // ==================== KEMBALI KE ATAS ====================
  void _scrollToTop() {
    if (_scrollController.hasClients) {
      _scrollController.animateTo(
        0,
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeInOut,
      );
    }
  }

  @override
  void dispose() {
    _scrollController.removeListener(_handleScroll);
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        titleSpacing: 20,
        title: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: primaryBlue,
                borderRadius: BorderRadius.circular(12),
              ),
              child: const Icon(
                Icons.newspaper_rounded,
                color: Colors.white,
                size: 23,
              ),
            ),
            const SizedBox(width: 10),
            const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'NewsDaily',
                  style: TextStyle(
                    fontSize: 21,
                    fontWeight: FontWeight.bold,
                    color: darkBlue,
                  ),
                ),
                Text(
                  'Berita terbaru untukmu',
                  style: TextStyle(fontSize: 11, color: Colors.blueGrey),
                ),
              ],
            ),
          ],
        ),
      ),

      // ==================== KONTEN UTAMA ====================
      body: FutureBuilder<List<Article>>(
        future: _articlesFuture,
        builder: (context, snapshot) {
          final isLoading = snapshot.connectionState == ConnectionState.waiting;

          final articles = snapshot.data ?? [];

          return RefreshIndicator(
            color: primaryBlue,
            backgroundColor: Colors.white,
            onRefresh: _refreshArticles,
            child: ListView(
              controller: _scrollController,
              physics: const AlwaysScrollableScrollPhysics(),
              padding: const EdgeInsets.fromLTRB(18, 12, 18, 100),
              children: [
                // ==================== BANNER UTAMA ====================
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(22),
                  decoration: BoxDecoration(
                    gradient: const LinearGradient(
                      colors: [primaryBlue, darkBlue],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                    borderRadius: BorderRadius.circular(24),
                    boxShadow: [
                      BoxShadow(
                        color: primaryBlue.withValues(alpha: 0.20),
                        blurRadius: 18,
                        offset: const Offset(0, 8),
                      ),
                    ],
                  ),
                  child: Stack(
                    children: [
                      const Positioned(
                        right: -8,
                        bottom: -12,
                        child: Icon(
                          Icons.public_rounded,
                          size: 100,
                          color: Color(0x30FFFFFF),
                        ),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 11,
                              vertical: 6,
                            ),
                            decoration: BoxDecoration(
                              color: Colors.white.withValues(alpha: 0.18),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: const Text(
                              'INFORMASI TERKINI',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 10,
                                fontWeight: FontWeight.bold,
                                letterSpacing: 1,
                              ),
                            ),
                          ),
                          const SizedBox(height: 16),
                          const Text(
                            'Tetap Update,\nJangan Lewatkan!',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 25,
                              height: 1.25,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 10),
                          const Text(
                            'Temukan informasi terbaru dari berbagai berita.',
                            style: TextStyle(
                              color: Color(0xFFDCE8FF),
                              fontSize: 13,
                              height: 1.5,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 28),

                // ==================== JUDUL DAFTAR ====================
                Row(
                  children: [
                    Container(
                      width: 5,
                      height: 27,
                      decoration: BoxDecoration(
                        color: primaryBlue,
                        borderRadius: BorderRadius.circular(5),
                      ),
                    ),
                    const SizedBox(width: 10),
                    const Expanded(
                      child: Text(
                        'Berita Terbaru',
                        style: TextStyle(
                          color: darkBlue,
                          fontSize: 21,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    if (!isLoading && articles.isNotEmpty)
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 10,
                          vertical: 6,
                        ),
                        decoration: BoxDecoration(
                          color: const Color(0xFFE3EDFF),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Text(
                          '${articles.length} berita',
                          style: const TextStyle(
                            color: primaryBlue,
                            fontSize: 11,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                  ],
                ),

                const SizedBox(height: 16),

                // ==================== LOADING ====================
                if (isLoading)
                  const Padding(
                    padding: EdgeInsets.symmetric(vertical: 60),
                    child: Column(
                      children: [
                        CircularProgressIndicator(color: primaryBlue),
                        SizedBox(height: 18),
                        Text(
                          'Sedang memuat berita...',
                          style: TextStyle(
                            color: Colors.blueGrey,
                            fontSize: 13,
                          ),
                        ),
                      ],
                    ),
                  )
                // ==================== ERROR ====================
                else if (snapshot.hasError)
                  _buildMessage(
                    icon: Icons.cloud_off_rounded,
                    title: 'Berita gagal dimuat',
                    subtitle: 'Periksa koneksi internet atau coba muat ulang.',
                    buttonText: 'Coba Lagi',
                    onPressed: _refreshArticles,
                  )
                // ==================== DATA KOSONG ====================
                else if (articles.isEmpty)
                  _buildMessage(
                    icon: Icons.article_outlined,
                    title: 'Belum ada berita',
                    subtitle:
                        'Data berita belum tersedia. Tarik layar ke bawah untuk mencoba lagi.',
                  )
                // ==================== DAFTAR BERITA ====================
                else
                  ...articles.asMap().entries.map((entry) {
                    final index = entry.key;
                    final article = entry.value;

                    return _buildArticleCard(article, index + 1);
                  }),

                const SizedBox(height: 20),

                // ==================== FOOTER ====================
                Center(
                  child: Text(
                    'NewsDaily • Informasi dalam genggaman',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.blueGrey.shade400,
                      fontSize: 11,
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),

      // ==================== TOMBOL SCROLL KE ATAS ====================
      floatingActionButton: _showBackToTop
          ? FloatingActionButton(
              onPressed: _scrollToTop,
              backgroundColor: primaryBlue,
              foregroundColor: Colors.white,
              elevation: 5,
              tooltip: 'Kembali ke atas',
              child: const Icon(Icons.keyboard_arrow_up_rounded),
            )
          : null,
    );
  }

  // ==================== KARTU BERITA ====================
  Widget _buildArticleCard(Article article, int number) {
    return Container(
      margin: const EdgeInsets.only(bottom: 18),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: const Color(0xFF173B70).withValues(alpha: 0.06),
            blurRadius: 15,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Gambar berita
          ClipRRect(
            borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
            child:
                (article.urlToImage != null && article.urlToImage!.isNotEmpty)
                ? Image.network(
                    article.urlToImage!,
                    width: double.infinity,
                    height: 200,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) {
                      return _imagePlaceholder();
                    },
                  )
                : _imagePlaceholder(),
          ),

          // Informasi berita
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 15, 16, 18),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Label berita
                Row(
                  children: [
                    const Icon(
                      Icons.fiber_manual_record,
                      color: primaryBlue,
                      size: 10,
                    ),
                    const SizedBox(width: 6),
                    Text(
                      'BERITA #${number.toString().padLeft(2, '0')}',
                      style: const TextStyle(
                        color: primaryBlue,
                        fontSize: 10,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 1,
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 10),

                // Judul
                Text(
                  article.title,
                  style: const TextStyle(
                    color: Color(0xFF1B2B45),
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                    height: 1.4,
                  ),
                ),

                const SizedBox(height: 9),

                // Deskripsi
                Text(
                  (article.description?.trim().isNotEmpty ?? false)
                      ? article.description!
                      : 'Belum ada deskripsi untuk berita ini.',
                  maxLines: 4,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    color: Color(0xFF69778D),
                    fontSize: 13,
                    height: 1.6,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // ==================== GAMBAR CADANGAN ====================
  Widget _imagePlaceholder() {
    return Container(
      width: double.infinity,
      height: 180,
      color: const Color(0xFFEAF0FA),
      child: const Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.image_outlined, size: 45, color: Color(0xFF91A6C5)),
          SizedBox(height: 8),
          Text(
            'Gambar tidak tersedia',
            style: TextStyle(color: Color(0xFF7185A2), fontSize: 12),
          ),
        ],
      ),
    );
  }

  // ==================== PESAN KOSONG / ERROR ====================
  Widget _buildMessage({
    required IconData icon,
    required String title,
    required String subtitle,
    String? buttonText,
    Future<void> Function()? onPressed,
  }) {
    return Container(
      margin: const EdgeInsets.only(top: 12),
      padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 30),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(18),
            decoration: const BoxDecoration(
              color: Color(0xFFEAF1FF),
              shape: BoxShape.circle,
            ),
            child: Icon(icon, size: 42, color: primaryBlue),
          ),
          const SizedBox(height: 18),
          Text(
            title,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 17,
              fontWeight: FontWeight.bold,
              color: darkBlue,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            subtitle,
            textAlign: TextAlign.center,
            style: const TextStyle(
              color: Colors.blueGrey,
              fontSize: 13,
              height: 1.5,
            ),
          ),
          if (buttonText != null && onPressed != null) ...[
            const SizedBox(height: 18),
            FilledButton.icon(
              onPressed: onPressed,
              icon: const Icon(Icons.refresh_rounded),
              label: Text(buttonText),
            ),
          ],
        ],
      ),
    );
  }
}
