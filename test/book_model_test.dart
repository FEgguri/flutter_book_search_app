import 'dart:convert';

import 'package:flutter_book_search_app/data/model/book.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('bookapitest', () {
    String dummyData = r'''
{
  "title": "Harry",
  "link": "https://search.shopping.naver.com/book/catalog/54297850481",
  "image": "https://shopping-phinf.pstatic.net/main_5429785/54297850481.20250419202246.jpg",
  "author": "",
  "discount": "27710",
  "publisher": "Anson Street Press",
  "pubdate": "20250328",
  "isbn": "9781023086219",
  "description": "\"Harry\" by Fanny Wheeler Hart offers a poignant glimpse into American domestic life through verse. This collection of biographical poetry explores themes of childhood and family, painted with the delicate brushstrokes of personal experience. Hart's work provides a window into a specific time, yet the emotions and experiences it captures resonate across generations."
}
''';

//1.toMap
    Map<String, dynamic> map = jsonDecode(dummyData);

    //2.toObject

    Book book = Book.fromJson(map);
    expect(book.discount, "27710"); //왼쪽값은 실제값 오른쪽은 기댓값
  });
}
