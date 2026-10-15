import 'package:flutter/material.dart';
import 'package:tugas3bmi/BMI.dart';

void main() {
  runApp(const MyApp());
}

// Class utama aplikasi
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Kalkulator BMI',
      debugShowCheckedModeBanner: false,

      // Mengatur halaman pertama aplikasi
      home: BMI()
    );
  }
}
