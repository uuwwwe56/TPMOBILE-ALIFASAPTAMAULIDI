import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tugas7/cart_model.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Keranjang Anda'),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
      ),

      body: Consumer<KeranjangModel>(
        builder: (context, cart, child) {
          if (cart.items.isEmpty) {
            return Center(child: Text('Keranjang kosong'));
          }

          return ListView.builder(
            itemCount: cart.items.length,
            itemBuilder: (context, index) {
              final item = cart.items[index];

              return Card(
                margin: EdgeInsets.all(5),
                child: ListTile(
                  leading: Icon(Icons.shopping_bag),
                  title: Text(item.nama),
                  subtitle: Text(item.deskripsi),

                  // TAMBAHAN: Tombol Hapus
                  trailing: ElevatedButton(
                    onPressed: () {
                      cart.remove(item);
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.red,
                      foregroundColor: Colors.white,
                    ),
                    child: Icon(Icons.delete),
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
