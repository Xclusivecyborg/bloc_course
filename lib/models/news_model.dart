import 'package:equatable/equatable.dart';

class News extends Equatable {
  const News({
    this.source,
    this.author,
    this.title,
    this.description,
    this.url,
    this.urlToImage,
    this.publishedAt,
    this.content,
  });

  final Source? source;
  final String? author;
  final String? title;
  final String? description;
  final String? url;
  final String? urlToImage;
  final String? publishedAt;
  final String? content;

  factory News.fromJson(Map<String, dynamic> json) => News(
        source: Source.fromJson(json["source"] ?? {}),
        author: json["author"] ?? '',
        title: json["title"] ?? '',
        description: json["description"] ?? '',
        url: json["url"] ?? '',
        urlToImage: json["urlToImage"] ?? '',
        publishedAt: json["publishedAt"] ?? DateTime.now().toString(),
        content: json["content"] ?? '',
      );

  @override
  String toString() {
    return 'News{source: $source, author: $author, title: $title, description: $description, url: $url, urlToImage: $urlToImage, publishedAt: $publishedAt, content: $content}';
  }

  @override
  List<Object> get props => [
        source!,
        author!,
        title!,
        description!,
        url!,
        urlToImage!,
        publishedAt!,
        content!,
      ];
}

class Source extends Equatable {
  const Source({
    this.id,
    this.name,
  });

  final String? id;
  final String? name;

  factory Source.fromJson(Map<String, dynamic> json) => Source(
        id: json["id"] ?? '',
        name: json["name"] ?? '',
      );

  @override
  String toString() {
    return 'Source{id: $id, name: $name}';
  }

  @override
  List<Object> get props => [
        id!,
        name!,
      ];
}
