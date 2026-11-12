import 'package:flutter/material.dart';
import 'package:tugas6/homePage.dart';

void main() {
  runApp(const MyApp());
}

final List<Map<String, String>> travelData = [
  {
    'nama': 'Gunung Fuji',
    'gambar':
        'https://tse4.mm.bing.net/th/id/OIP.9n4olUwfRZ5S8MTmaeCU6QHaE8?r=0&rs=1&pid=ImgDetMain&o=7&rm=3',
    'lokasi': 'Jepang',
  },
  {
    'nama': 'Menara Eiffel',
    'gambar':
        'https://ik.imagekit.io/tvlk/blog/2020/04/Menara-Eiffel-Wikipedia.jpg?tr=dpr-2,w-675',
    'lokasi': 'Paris',
  },
];

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Katalog',
      home: HomePage(travelData: travelData),
      theme: ThemeData(
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.blueAccent,
          foregroundColor: Colors.white,
          centerTitle: true,
        ),
      ),
    );
  }
}
