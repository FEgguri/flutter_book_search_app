import 'package:flutter/material.dart';
import 'package:flutter_book_search_app/ui/detail/detail_page.dart';

class HomeBottomSheet extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 300,
      padding: EdgeInsets.only(top: 20, right: 20, left: 20, bottom: 50),
      child: Row(
        children: [
          Image.network(
            'https://picsum.photos/200/300',
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
                '해리포터 마법사의돌',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                '롤링',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text('마법사 해리포터의 이야기를 소개하는 책입니다 다양한 이야기를 읽어보세요'),
              Spacer(),
              GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) {
                        return DetailPage();
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
