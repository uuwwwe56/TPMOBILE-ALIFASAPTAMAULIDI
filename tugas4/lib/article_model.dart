
class Article {
  final String title;
  final String? description;
  final String? urlToImage;

  // Constructor untuk membuat objek Article memnggil dirinya sendiri
  Article({
    required this.title,
    this.description,
    this.urlToImage,
  });

  // Mengubah data JSON menjadi objek Article
  factory Article.fromJson(Map<String, dynamic> json) {
    return Article(
      title: json['title'] as String? ?? 'Judul tidak tersedia',
      description: json['description'] as String?,
      urlToImage: json['urlToImage'] as String?,
      
    );
  }
}
