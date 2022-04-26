class News {
  News({
    this.source,
    this.author,
    this.title,
    this.description,
    this.url,
    this.urlToImage,
    this.publishedAt,
    this.content,
  });

  Source? source;
  String? author;
  String? title;
  String? description;
  String? url;
  String? urlToImage;
  DateTime? publishedAt;
  String? content;

  factory News.fromJson(Map<String, dynamic> json) => News(
        source: Source.fromJson(json["source"] ?? {}),
        author: json["author"] ?? ' ',
        title: json["title"] ?? ' ',
        description: json["description"] ?? ' ',
        url: json["url"] ?? ' ',
        urlToImage: json["urlToImage"] ?? '',
        publishedAt: DateTime.parse(json["publishedAt"]),
        content: json["content"] ?? ' ',
      );

  @override
  String toString() {
    return 'News{source: $source, author: $author, title: $title, description: $description, url: $url, urlToImage: $urlToImage, publishedAt: $publishedAt, content: $content}';
  }
}

class Source {
  Source({
    this.id,
    this.name,
  });

  String? id;
  String? name;

  factory Source.fromJson(Map<String, dynamic> json) => Source(
        id: json["id"] ?? ' ',
        name: json["name"] ?? ' ',
      );

  @override
  String toString() {
    return 'Source{id: $id, name: $name}';
  }
}
