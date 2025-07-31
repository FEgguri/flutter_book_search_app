import 'package:flutter/material.dart';
import 'package:flutter_book_search_app/data/model/book.dart';
import 'package:flutter_book_search_app/ui/detail/detail_page.dart';

class HomeBottomSheet extends StatelessWidget {
  HomeBottomSheet(this.book);
  Book book;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 300,
      padding: EdgeInsets.only(top: 20, right: 20, left: 20, bottom: 50),
      child: Row(
        children: [
          Image.network(
            book.image,
            fit: BoxFit.cover,
          ),
          SizedBox(
            width: 20,
          ),
          Expanded(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                book.title,
                maxLines: 2,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                book.author,
                maxLines: 2,
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                book.description,
                maxLines: 2,
              ),
              Spacer(),
              GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) {
                        return DetailPage(book);
                      }),
                    );
                  },
                  child: Container(
                    width: double.infinity,
                    height: 50,
                    alignment: Alignment.center,
                    color: Colors.transparent,
                    child: Text(
                      '자세히보기',
                      style: TextStyle(
                        color: Colors.blue,
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                      ),
                    ),
                  )),
            ],
          ))
        ],
      ),
    );
  }
}
