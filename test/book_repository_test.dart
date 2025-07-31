import 'package:flutter_book_search_app/data/repository/book_repository.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('BookrepositoryTest', () async {
    BookRepository bookRepository = BookRepository();
    final books = await bookRepository.searchBook('harry');
    expect(books.isEmpty, false);
    for (var book in books) {
      print(book.toJson());
    }
  });
}
