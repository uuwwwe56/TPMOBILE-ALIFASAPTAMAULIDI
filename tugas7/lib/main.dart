import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tugas7/product_page.dart';
import 'cart_model.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => KeranjangModel(),
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Aplikasi Sembako',
      home: ProductPage(),
    );
  }
}