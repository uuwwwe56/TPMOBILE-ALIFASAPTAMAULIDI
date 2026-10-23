import 'dart:convert';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'article_model.dart';

class ApiService {
  // Masukkan API key asli dari dashboard NewsAPI
  static const String _apiKey = '6a29c2d3da024fff8689daabbf564da4';

  // Mengambil berita utama dari Indonesia
  static const String _baseUrl = 'https://newsapi.org/v2/top-headlines';

  // Mengambil daftar berita dari server
  Future<List<Article>> fetchArticles() async {
    try {
      // Membuat URL beserta parameter API
      final uri = Uri.parse(_baseUrl).replace(
        queryParameters: {'country': 'us', 'apiKey': _apiKey, 'pageSize': '20'},
      );

      // Mengirim permintaan HTTP GET
      final response = await http.get(uri);

      // Menampilkan respons di Debug Console
      print('STATUS CODE: ${response.statusCode}');
      print('RESPONS API: ${response.body}');

      // Memeriksa apakah permintaan berhasil
      if (response.statusCode == 200) {
        final Map<String, dynamic> json = jsonDecode(response.body);

        final List<dynamic> articlesJson = json['articles'];

        // Mengubah JSON menjadi daftar objek Article
        return articlesJson.map((item) {
          return Article.fromJson(item as Map<String, dynamic>);
        }).toList();
      } else {
        // Mengambil pesan error dari server
        final Map<String, dynamic> json = jsonDecode(response.body);

        throw Exception(
          'Gagal memuat berita: '
          '${json['code']} - ${json['message']}',
        );
      }
    } catch (e) {
      throw Exception('Gagal mengambil berita: $e');
    }
  }
}

