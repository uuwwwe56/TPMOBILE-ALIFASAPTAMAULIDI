
import 'package:flutter/foundation.dart';

class Product {
  final String nama,deskripsi,gambar;
  Product(this.nama,this.deskripsi,this.gambar);
}

class KeranjangModel extends ChangeNotifier {
  final List<Product> _items = [];

  List<Product> get items => _items;

  int get  totalItems => _items.length;
  
  void add(Product product) {
    _items.add(product);
    notifyListeners();
  }
  // TAMBAHAN: Fungsi menghapus produk
  void remove(Product product) {
    _items.remove(product);
    notifyListeners();
  }
}
