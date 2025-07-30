import 'package:flutter/material.dart';
import 'package:flutter_book_search_app/ui/home/widgets/home_bottom_sheet.dart';

class HomePage extends StatefulWidget {
  HomePage({super.key});
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController textEditingController = TextEditingController();

//컨트롤러사용시 반드시 디스포즈 사용
  @override
  void dispose() {
    textEditingController.dispose();
    super.dispose(); //<----??
  }

  //내부에 구현되어있는 TextEditingController  초기화
  void onSearch(String text) {
    print('onSearch');
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: Scaffold(
          appBar: AppBar(
            actions: [
              GestureDetector(
                  onTap: () {
                    //아이콘 클릭했을때 온서치 함수 호출
                    onSearch(textEditingController.text);
                  },
                  //버튼의 터치영역은 44픽셀 이상으로 해줘야 효율적이다
                  child: Container(
                      width: 50,
                      height: 50,
                      //컬러투명이있어야 컨테이너영역이 터치가 된다
                      color: Colors.transparent,
                      child: Icon(Icons.search)))
            ],
            title: TextField(
              onSubmitted: onSearch,
              maxLines: 1, //maxlenght와 maxline의 차이..??
              controller: textEditingController, //컨트롤러
              decoration: InputDecoration(
                hintText: '검색어를 입력해 주세요',
                border: MaterialStateOutlineInputBorder.resolveWith((states) {
                  if (states.contains(WidgetState.focused)) {
                    return OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(color: Colors.black));
                  }
                  return OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(color: Colors.grey));
                }),
              ),
            ),
          ),
          body: GridView.builder(
            padding: EdgeInsets.all(20),
            itemCount: 10,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                childAspectRatio: 3 / 4,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10),
            itemBuilder: (context, index) {
              return GestureDetector(
                  onTap: () {
                    showModalBottomSheet(
                        context: context,
                        builder: (context) {
                          return HomeBottomSheet();
                        });
                  },
                  child: Image.network('https://picsum.photos/200/300'));
            },
          ),
        ));
  }
}
