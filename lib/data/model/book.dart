class Book {
  String title;
  String link;
  String image;
  String author;
  String discount;
  String publisher;
  String pubdate;
  String isbn;
  String description;

  Book(
      {required this.title,
      required this.link,
      required this.image,
      required this.author,
      required this.discount,
      required this.publisher,
      required this.pubdate,
      required this.isbn,
      required this.description});

  Book.fromJson(Map<String, dynamic> map)
      : this(
          title: map['title'],
          link: map['link'],
          image: map['image'],
          author: map['author'],
          discount: map['discount'],
          publisher: map['publisher'],
          pubdate: map['pubdate'],
          isbn: map['isbn'],
          description: map['description'],
        );

  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'link': link,
      'image': image,
      'author': author,
      'discount': discount,
      'publisher': publisher,
      'pubdate': pubdate,
      'isbn': isbn,
      'description': description,
    };
  }
}
