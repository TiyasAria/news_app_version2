import 'source.dart';

class Article {

  Article({
    required this.source,
    required this.author,
    required this.title,
    required this.description,
    required this.url,
    required this.urlToImage,
    required this.publishedAt,
    required this.content,
  });

  Source source;
  String author;
  String title;
  String description;
  String url;
  String urlToImage;
  String publishedAt;
  String content;

  factory Article.fromJson(Map<String, dynamic> json) => Article(
    source: Source.fromJson(json["source"]),
    author: json["author"] ?? "null" ,
    title: json["title"] ?? "null",
    description: json["description"] ?? "null",
    url: json["url"] ?? "null",
    urlToImage: json["urlToImage"] ?? "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRDmjojmbnYInxesXTpd2QAwVAIfzUHULxQRg&usqp=CAU",
    publishedAt: json["publishedAt"] ?? "null" ,
    content: json["content"] ?? "null",
  );
}


