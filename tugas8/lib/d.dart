// MAIN
// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import 'theme_provider.dart';

// void main() async {
//   WidgetsFlutterBinding.ensureInitialized();

//   runApp(
//     ChangeNotifierProvider(
//       create: (context) => ThemeProvider(),
//       child: const MyApp(),
//     ),
//   );
// }

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Consumer<ThemeProvider>(
//       builder: (context, themeProvider, child) {
//         return MaterialApp(
//           title: 'Theme Demo',
//           theme: ThemeData.light(useMaterial3: true),
//           darkTheme: ThemeData.dark(useMaterial3: true),
//           themeMode: themeProvider.themeMode,
//           home: const HomePage(),
//           debugShowCheckedModeBanner: false,
//         );
//       },
//     );
//   }
// }

// // ==========================================
// // PERUBAHAN 1: STATELESSWIDGET MENJADI STATEFULWIDGET
// // ==========================================
// class HomePage extends StatefulWidget {
//   const HomePage({super.key});

//   @override
//   State<HomePage> createState() => _HomePageState();
// }

// class _HomePageState extends State<HomePage> {
//   // ==========================================
//   // TAMBAHAN 2: CONTROLLER INPUT NAMA
//   // ==========================================
//   final TextEditingController nameController = TextEditingController();

//   // ==========================================
//   // TAMBAHAN 3: DISPOSE CONTROLLER
//   // ==========================================
//   @override
//   void dispose() {
//     nameController.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     final themeProvider = Provider.of<ThemeProvider>(context);

//     return Scaffold(
//       appBar: AppBar(title: const Text('Pengaturan Tema')),

//       body: Center(
//         child: Padding(
//           padding: const EdgeInsets.all(20.0),

//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               // ==========================================
//               // BAGIAN AWAL MODUL: PENGATURAN TEMA
//               // ==========================================
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   const Text('Mode Gelap', style: TextStyle(fontSize: 18)),

//                   Switch(
//                     value: themeProvider.isDarkMode,
//                     onChanged: (value) {
//                       final provider = Provider.of<ThemeProvider>(
//                         context,
//                         listen: false,
//                       );

//                       provider.toggleTheme(value);
//                     },
//                   ),
//                 ],
//               ),

//               const SizedBox(height: 30),

//               // ==========================================
//               // TAMBAHAN 4: JUDUL INPUT NAMA
//               // ==========================================
//               const Align(
//                 alignment: Alignment.centerLeft,
//                 child: Text(
//                   'Nama Pengguna',
//                   style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
//                 ),
//               ),

//               const SizedBox(height: 10),

//               // ==========================================
//               // TAMBAHAN 5: TEXTFIELD INPUT NAMA
//               // ==========================================
//               TextField(
//                 controller: nameController,
//                 decoration: const InputDecoration(
//                   border: OutlineInputBorder(),
//                   hintText: 'Masukkan nama pengguna',
//                   prefixIcon: Icon(Icons.person),
//                 ),
//               ),

//               const SizedBox(height: 15),

//               // ==========================================
//               // TAMBAHAN 6: TOMBOL SIMPAN NAMA
//               // ==========================================
//               SizedBox(
//                 width: double.infinity,
//                 child: ElevatedButton(
//                   onPressed: () {
//                     final name = nameController.text.trim();

//                     if (name.isNotEmpty) {
//                       final provider = Provider.of<ThemeProvider>(
//                         context,
//                         listen: false,
//                       );

//                       provider.saveUserName(name);

//                       ScaffoldMessenger.of(context).showSnackBar(
//                         const SnackBar(
//                           content: Text('Nama berhasil disimpan!'),
//                         ),
//                       );

//                       nameController.clear();
//                     }
//                   },
//                   child: const Text('Simpan Nama'),
//                 ),
//               ),

//               const SizedBox(height: 25),

//               // ==========================================
//               // TAMBAHAN 7: MENAMPILKAN NAMA TERSIMPAN
//               // ==========================================
//               const Text(
//                 'Nama Tersimpan:',
//                 style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
//               ),

//               const SizedBox(height: 10),

//               Text(
//                 themeProvider.userName.isEmpty
//                     ? 'Belum ada nama tersimpan'
//                     : themeProvider.userName,
//                 style: const TextStyle(
//                   fontSize: 20,
//                   fontWeight: FontWeight.bold,
//                   color: Colors.blue,
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }






// =============================
// import 'package:flutter/material.dart';
// import 'package:shared_preferences/shared_preferences.dart';

// class ThemeProvider extends ChangeNotifier {
//   ThemeMode _themeMode = ThemeMode.light;

//   ThemeMode get themeMode => _themeMode;

//   bool get isDarkMode => _themeMode == ThemeMode.dark;

//   // ==========================================
//   // TAMBAHAN 1: VARIABEL NAMA PENGGUNA
//   // ==========================================
//   String _userName = '';

//   // TAMBAHAN 2: GETTER UNTUK MENGAMBIL NAMA
//   String get userName => _userName;

//   // ==========================================
//   // KEY PENYIMPANAN SHARED PREFERENCES
//   // ==========================================
//   static const String _themeKey = 'theme_key';

//   // TAMBAHAN 3: KEY UNTUK NAMA PENGGUNA
//   static const String _nameKey = 'user_name';

//   ThemeProvider() {
//     _loadTheme();
//   }

//   // ==========================================
//   // MEMUAT TEMA DAN NAMA PENGGUNA
//   // ==========================================
//   void _loadTheme() async {
//     final prefs = await SharedPreferences.getInstance();

//     final isDark = prefs.getBool(_themeKey) ?? false;

//     _themeMode = isDark ? ThemeMode.dark : ThemeMode.light;

//     // TAMBAHAN 4: MENGAMBIL NAMA YANG TERSIMPAN
//     _userName = prefs.getString(_nameKey) ?? '';

//     notifyListeners();
//   }

//   // ==========================================
//   // FUNGSI MENGUBAH DAN MENYIMPAN TEMA
//   // ==========================================
//   void toggleTheme(bool isOn) async {
//     _themeMode = isOn ? ThemeMode.dark : ThemeMode.light;

//     notifyListeners();

//     final prefs = await SharedPreferences.getInstance();
//     await prefs.setBool(_themeKey, isOn);
//   }

//   // ==========================================
//   // TAMBAHAN 5: FUNGSI MENYIMPAN NAMA
//   // ==========================================
//   void saveUserName(String name) async {
//     final prefs = await SharedPreferences.getInstance();

//     _userName = name;

//     await prefs.setString(_nameKey, name);

//     notifyListeners();
//   }
// }
