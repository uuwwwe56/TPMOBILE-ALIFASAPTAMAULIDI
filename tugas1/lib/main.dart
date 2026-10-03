import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

// Class utama aplikasi
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,

      // Memanggil halaman Home
      home: Home(),
    );
  }
}

// Class halaman Home
class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      // AppBar
      appBar: AppBar(
        title: const Text('Flutter Pertama Saya'),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
      ),

      // Isi halaman
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            // Text biasa
            const Text(
              'Hello World',
              style: TextStyle(
                fontSize: 20,
              ),
            ),

            const SizedBox(height: 15),

            // Text uppercase + bold + warna biru
            const Text(
              'HELLO WORLD',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.blue,
              ),
            ),

            const SizedBox(height: 15),

            // Text warna merah
            const Text(
              'Hello Flutterrssss',
              style: TextStyle(
                fontSize: 28,
                color: Colors.red,
              ),
            ),

            const SizedBox(height: 15),

            // Text bold + ukuran besar + warna hijau
            const Text(
              'BELAJAR FLUTTER',
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                color: Colors.green,
              ),
            ),

            const SizedBox(height: 15),

            // Text dengan beberapa style
            const Text(
              'Hello, Saya Sedang Belajar Flutter GACORRR!',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.purple,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

