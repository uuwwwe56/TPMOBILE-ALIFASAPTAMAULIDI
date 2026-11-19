// // di main
// // // TAMBAHAN: Tombol Hapus
// //                 trailing: ElevatedButton(
// //                   onPressed: () {
// //                     cart.remove(cart.items[index]);
// //                   },
// //                   style: ElevatedButton.styleFrom(
// //                     backgroundColor: Colors.red,
// //                     foregroundColor: Colors.white,
// //                   ),
// //                   child: const Text('Hapus'),
// //                 ),

// //   // di car_model
// //     void remove(Product product) {
// //     _items.remove(product);
// //     notifyListeners();
// //   }


// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import 'cart_model.dart';

// void main() {
//   runApp(
//     ChangeNotifierProvider(
//       create: (context) => CartModel(),
//       child: const MyApp(),
//     ),
//   );
// }

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return const MaterialApp(
//       title: 'Provider Demo',
//       home: ProductPage(),
//       debugShowCheckedModeBanner: false,
//     );
//   }
// }

// class ProductPage extends StatelessWidget {
//   const ProductPage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     final List<Product> products = [
//       Product('Laptop'),
//       Product('Mouse'),
//       Product('Keyboard'),
//     ];

//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Daftar Produk'),
//         actions: [
//           Padding(
//             padding: const EdgeInsets.only(right: 20.0),
//             child: Consumer<CartModel>(
//               builder: (context, cart, child) {
//                 return Badge(
//                   label: Text('${cart.totalItems}'),
//                   isLabelVisible: cart.totalItems > 0,
//                   child: IconButton(
//                     icon: const Icon(Icons.shopping_cart),
//                     onPressed: () {
//                       Navigator.push(
//                         context,
//                         MaterialPageRoute(
//                           builder: (context) => const CartPage(),
//                         ),
//                       );
//                     },
//                   ),
//                 );
//               },
//             ),
//           ),
//         ],
//       ),

//       body: ListView.builder(
//         itemCount: products.length,
//         itemBuilder: (context, index) {
//           final product = products[index];

//           return ListTile(
//             title: Text(product.name),
//             trailing: IconButton(
//               icon: const Icon(Icons.add_shopping_cart),
//               onPressed: () {
//                 Provider.of<CartModel>(context, listen: false).add(product);
//               },
//             ),
//           );
//         },
//       ),
//     );
//   }
// }

// class CartPage extends StatelessWidget {
//   const CartPage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: const Text('Keranjang Anda')),

//       body: Consumer<CartModel>(
//         builder: (context, cart, child) {
//           if (cart.items.isEmpty) {
//             return const Center(child: Text('Keranjang masih kosong.'));
//           }

//           return ListView.builder(
//             itemCount: cart.items.length,
//             itemBuilder: (context, index) {
              
// return ListTile(
//                 title: Text(cart.items[index].name),

//                 // TAMBAHAN: Tombol Hapus
//                 trailing: ElevatedButton(
//                   onPressed: () {
//                     cart.remove(cart.items[index]);
//                   },
//                   style: ElevatedButton.styleFrom(
//                     backgroundColor: Colors.red,
//                     foregroundColor: Colors.white,
//                   ),
//                   child: const Text('Hapus'),
//                 ),
//               );
//             },
//           );
//         },
//       ),
//     );
//   }
// }


// // return ListTile(
// //                 title: Text(cart.items[index].name)
// // //                 );

// // ================
// // import 'package:flutter/foundation.dart';

// class Product {
//   final String name;

//   Product(this.name);
// }

// class CartModel extends ChangeNotifier {
//   final List<Product> _items = [];

//   List<Product> get items => _items;

//   int get totalItems => _items.length;

//   void add(Product product) {
//     _items.add(product);
//     notifyListeners();
//   }

//    // TAMBAHAN: Fungsi Hapus Produk
//   void remove(Product product) {
//     _items.remove(product);
//     notifyListeners();
//   }
  
// }


