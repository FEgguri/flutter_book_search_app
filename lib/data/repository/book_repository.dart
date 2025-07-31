import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_book_search_app/data/model/book.dart';
import 'package:http/http.dart';

class BookRepository {
  Future<List<Book>> searchBook(String query) async {
    final client = Client();
    final response = await client.get(
      Uri.parse('https://openapi.naver.com/v1/search/book.json?query=$query'),
      headers: {
        'X-Naver-Client-Id': '4Uj1Pa0ofoQl__0KQohr',
        'X-Naver-Client-Secret': '4a42zerGvk'
      },
    );
    //get success => 200
    //response = 200
    // body 데이터를 jsonDecode 함수 사용해서 map 으로 바꾼 후 List<Book> 으로 변환
    if (response.statusCode == 200) {
      Map<String, dynamic> map = jsonDecode(response.body);
      final items = List.from(map['items']);
      final iterable = items.map((e) {
        //< ---???
        //MappedIterable 이라는 클래스에 함수를 넘겨줄테니 나중에 요청하면 그떄 List(items) 하나씩 반복문을 돌면서 내가 넘겨준 함수를 실행시켜서 새로운 리스트로 돌려줘
        return Book.fromJson(e);
      });
      final list = iterable.toList();
      return list;
    }
    //아닐떄 빈 리스트 반환
    //
    return [];
  }
}
