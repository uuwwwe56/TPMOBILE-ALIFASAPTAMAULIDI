import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

// ChangeNotifier digunakan agar widget bisa mendengarkan perubahan data.
class ThemeProvider extends ChangeNotifier {
  // Menyimpan mode tema aplikasi.
  ThemeMode _themeMode = ThemeMode.light;

  // Getter untuk mengambil mode tema dari luar class.
  ThemeMode get themeMode => _themeMode;

  // Mengecek apakah aplikasi sedang menggunakan Dark Mode.
  bool get isDarkMode => _themeMode == ThemeMode.dark;

  // Menyimpan nama pengguna.
  String _userName = '';

  // Getter untuk mengambil nama pengguna.
  String get userName => _userName;

  // Key untuk menyimpan data di SharedPreferences.
  static const String _themeKey = 'theme_key';
  static const String _nameKey = 'user_name';

  // Constructor dijalankan ketika ThemeProvider dibuat.
  // Memanggil fungsi untuk mengambil data yang tersimpan.
  ThemeProvider() {
    _loadPreferences();
  }

  // Mengambil data tema dan nama dari SharedPreferences.
  Future<void> _loadPreferences() async {
    // Mengakses penyimpanan lokal.
    final prefs = await SharedPreferences.getInstance();

    // Mengambil data tema, default-nya Light Mode.
    final isDark = prefs.getBool(_themeKey) ?? false;

    // Mengubah nilai tema berdasarkan data tersimpan.
    _themeMode = isDark ? ThemeMode.dark : ThemeMode.light;

    // Mengambil nama pengguna yang tersimpan.
    _userName = prefs.getString(_nameKey) ?? '';

    // Memberi tahu widget bahwa data sudah diperbarui.
    notifyListeners();
  }

  // Mengubah tema Light Mode dan Dark Mode.
  Future<void> toggleTheme(bool isOn) async {
    // Mengubah nilai tema.
    _themeMode = isOn ? ThemeMode.dark : ThemeMode.light;

    // Memperbarui tampilan aplikasi.
    notifyListeners();

    // Mengakses SharedPreferences.
    final prefs = await SharedPreferences.getInstance();

    // Menyimpan pilihan tema.
    await prefs.setBool(_themeKey, isOn);
  }

  // Menyimpan nama pengguna.
  Future<void> saveUserName(String name) async {
    // Mengakses SharedPreferences.
    final prefs = await SharedPreferences.getInstance();

    // Menyimpan nama ke penyimpanan lokal.
    await prefs.setString(_nameKey, name);

    // Memperbarui nilai nama di dalam Provider.
    _userName = name;

    // Memberi tahu widget bahwa nama sudah berubah.
    notifyListeners();
  }
}
