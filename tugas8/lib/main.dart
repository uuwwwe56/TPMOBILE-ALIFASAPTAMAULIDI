import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'theme_provider.dart';

// Fungsi utama untuk menjalankan aplikasi Flutter.
void main() async {
  // Memastikan binding Flutter siap sebelum menjalankan kode async.
  WidgetsFlutterBinding.ensureInitialized();

  // Menyediakan ThemeProvider ke seluruh widget aplikasi.
  runApp(
    ChangeNotifierProvider(
      create: (context) => ThemeProvider(),
      child: const MyApp(),
    ),
  );
}

// Widget utama aplikasi.
// StatelessWidget digunakan karena state tema dikelola oleh Provider.
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // Consumer mendengarkan perubahan ThemeProvider.
    // Jika tema berubah, MaterialApp akan diperbarui.
    return Consumer<ThemeProvider>(
      builder: (context, themeProvider, child) {
        return MaterialApp(
          title: 'Theme Demo',

          // Konfigurasi tampilan Light Mode.
          theme: ThemeData(
            useMaterial3: true,
            brightness: Brightness.light,
            colorScheme: ColorScheme.fromSeed(
              seedColor: const Color(0xFF6366F1),
              brightness: Brightness.light,
            ),
            scaffoldBackgroundColor: const Color(0xFFF5F6FA),
            appBarTheme: const AppBarTheme(
              backgroundColor: Color(0xFFF5F6FA),
              elevation: 0,
              centerTitle: false,
            ),
            cardTheme: CardThemeData(
              elevation: 0,
              color: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
            ),
          ),

          // Konfigurasi tampilan Dark Mode.
          darkTheme: ThemeData(
            useMaterial3: true,
            brightness: Brightness.dark,
            colorScheme: ColorScheme.fromSeed(
              seedColor: const Color(0xFF818CF8),
              brightness: Brightness.dark,
            ),
            cardTheme: CardThemeData(
              elevation: 0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
            ),
          ),

          // Mengambil mode tema dari ThemeProvider.
          themeMode: themeProvider.themeMode,

          // Halaman pertama aplikasi.
          home: const HomePage(),

          // Menghilangkan banner DEBUG.
          debugShowCheckedModeBanner: false,
        );
      },
    );
  }
}

// Halaman utama menggunakan StatefulWidget
// karena membutuhkan TextEditingController.
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // Controller untuk mengambil teks dari TextField.
  final TextEditingController nameController = TextEditingController();

  // Dispose digunakan untuk membersihkan controller
  // ketika halaman sudah tidak digunakan.
  @override
  void dispose() {
    nameController.dispose();
    super.dispose();
  }

  // Fungsi untuk menyimpan nama pengguna.
  Future<void> saveName() async {
    // Mengambil teks dan menghapus spasi di awal/akhir.
    final name = nameController.text.trim();

    // Memeriksa apakah input kosong.
    if (name.isEmpty) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text('Nama tidak boleh kosong!')));
      return;
    }

    // Mengambil ThemeProvider tanpa membuat widget listen.
    final provider = Provider.of<ThemeProvider>(context, listen: false);

    // Menyimpan nama menggunakan Provider.
    await provider.saveUserName(name);

    // Memastikan halaman masih aktif sebelum menggunakan context.
    if (!mounted) return;

    // Membersihkan input setelah berhasil disimpan.
    nameController.clear();

    // Memberikan notifikasi kepada pengguna.
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Nama berhasil disimpan!'),
        behavior: SnackBarBehavior.floating,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    // Mengambil provider untuk membaca data pengguna.
    final themeProvider = context.watch<ThemeProvider>();

    // Mengambil informasi tema saat ini.
    final isDark = themeProvider.isDarkMode;

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Pengaturan',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
      ),

      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20),

          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // HEADER HALAMAN
              Text(
                'Personalisasi Aplikasi',
                style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 8),

              Text(
                'Atur tampilan dan informasi akun kamu.',
                style: TextStyle(
                  color: Theme.of(context).hintColor,
                  fontSize: 14,
                ),
              ),

              const SizedBox(height: 28),

              // JUDUL BAGIAN TEMA
              const SectionTitle(
                title: 'Tampilan',
                subtitle: 'Sesuaikan tema aplikasi',
              ),

              const SizedBox(height: 14),

              // CARD PENGATURAN TEMA
              Card(
                child: Padding(
                  padding: const EdgeInsets.all(18),

                  child: Row(
                    children: [
                      // ICON TEMA
                      Container(
                        padding: const EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          color: Colors.amber.withValues(alpha: 0.15),
                          borderRadius: BorderRadius.circular(14),
                        ),
                        child: Icon(
                          isDark
                              ? Icons.dark_mode_rounded
                              : Icons.light_mode_rounded,
                          color: Colors.amber,
                          size: 28,
                        ),
                      ),

                      const SizedBox(width: 14),

                      // INFORMASI TEMA
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'Mode Gelap',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),

                            const SizedBox(height: 5),

                            Text(
                              isDark
                                  ? 'Tema gelap sedang aktif'
                                  : 'Tema terang sedang aktif',
                              style: TextStyle(
                                color: Theme.of(context).hintColor,
                                fontSize: 12,
                              ),
                            ),
                          ],
                        ),
                      ),

                      // SWITCH UNTUK MENGUBAH TEMA
                      Switch.adaptive(
                        value: isDark,
                        onChanged: (value) {
                          // Mengubah tema melalui Provider.
                          context.read<ThemeProvider>().toggleTheme(value);
                        },
                      ),
                    ],
                  ),
                ),
              ),

              const SizedBox(height: 30),

              // JUDUL BAGIAN PROFIL
              const SectionTitle(
                title: 'Profil Pengguna',
                subtitle: 'Kelola nama pengguna kamu',
              ),

              const SizedBox(height: 14),

              // CARD INPUT NAMA
              Card(
                child: Padding(
                  padding: const EdgeInsets.all(18),

                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // LABEL INPUT
                      const Text(
                        'Nama Pengguna',
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w600,
                        ),
                      ),

                      const SizedBox(height: 12),

                      // TEXTFIELD INPUT NAMA
                      TextField(
                        controller: nameController,
                        textCapitalization: TextCapitalization.words,
                        decoration: InputDecoration(
                          hintText: 'Masukkan nama kamu',
                          prefixIcon: const Icon(Icons.person_outline),
                          filled: true,
                          fillColor: Theme.of(context)
                              .colorScheme
                              .surfaceContainerHighest
                              .withValues(alpha: 0.4),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(14),
                            borderSide: BorderSide.none,
                          ),
                        ),
                      ),

                      const SizedBox(height: 18),

                      // TOMBOL SIMPAN
                      SizedBox(
                        width: double.infinity,
                        height: 52,
                        child: ElevatedButton.icon(
                          onPressed: saveName,
                          icon: const Icon(Icons.save_rounded),
                          label: const Text(
                            'Simpan Nama',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Theme.of(
                              context,
                            ).colorScheme.primary,
                            foregroundColor: Theme.of(
                              context,
                            ).colorScheme.onPrimary,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(14),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              const SizedBox(height: 30),

              // JUDUL BAGIAN HASIL
              const SectionTitle(
                title: 'Informasi Akun',
                subtitle: 'Data pengguna yang tersimpan',
              ),

              const SizedBox(height: 14),

              // CARD MENAMPILKAN NAMA
              Card(
                child: Padding(
                  padding: const EdgeInsets.all(20),

                  child: Row(
                    children: [
                      // AVATAR PENGGUNA
                      CircleAvatar(
                        radius: 28,
                        backgroundColor: Theme.of(
                          context,
                        ).colorScheme.primaryContainer,
                        child: Icon(
                          Icons.person_rounded,
                          size: 30,
                          color: Theme.of(
                            context,
                          ).colorScheme.onPrimaryContainer,
                        ),
                      ),

                      const SizedBox(width: 15),

                      // DATA NAMA PENGGUNA
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Nama Tersimpan',
                              style: TextStyle(
                                fontSize: 12,
                                color: Theme.of(context).hintColor,
                              ),
                            ),

                            const SizedBox(height: 6),

                            Text(
                              themeProvider.userName.isEmpty
                                  ? 'Belum ada nama'
                                  : themeProvider.userName,
                              style: const TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),

                      Icon(
                        Icons.check_circle_rounded,
                        color: Colors.green,
                        size: 24,
                      ),
                    ],
                  ),
                ),
              ),

              const SizedBox(height: 30),

              // FOOTER
              Center(
                child: Text(
                  'Theme Demo • Flutter Material 3',
                  style: TextStyle(
                    color: Theme.of(context).hintColor,
                    fontSize: 12,
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

// Widget kecil untuk membuat judul setiap bagian.
// Dipisahkan agar kode HomePage lebih rapi dan mudah digunakan ulang.
class SectionTitle extends StatelessWidget {
  final String title;
  final String subtitle;

  const SectionTitle({super.key, required this.title, required this.subtitle});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 4),
        Text(
          subtitle,
          style: TextStyle(fontSize: 12, color: Theme.of(context).hintColor),
        ),
      ],
    );
  }
}
