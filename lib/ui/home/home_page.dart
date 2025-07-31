import 'package:flutter/material.dart';
import 'package:flutter_book_search_app/ui/home/home_view_model.dart';
import 'package:flutter_book_search_app/ui/home/widgets/home_bottom_sheet.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomePage extends ConsumerStatefulWidget {
  HomePage({super.key});
  @override
  ConsumerState<HomePage> createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePage> {
  TextEditingController textEditingController = TextEditingController();

//컨트롤러사용시 반드시 디스포즈 사용
  @override
  void dispose() {
    textEditingController.dispose();
    super.dispose(); //<----??
  }

  //내부에 구현되어있는 TextEditingController  초기화
  void onSearch(String text) {
    //TODO 홈뷰모델의 서치북스 메서드 호출
    ref.read(homeviewModelProvider.notifier).searchBooks(text);
    print('onSearch');
  }

  @override
  Widget build(BuildContext context) {
    final homeState = ref.watch(homeviewModelProvider);
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
            itemCount: homeState.books.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                childAspectRatio: 3 / 4,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10),
            itemBuilder: (context, index) {
              final book = homeState.books[index];
              return GestureDetector(
                  onTap: () {
                    showModalBottomSheet(
                        context: context,
                        builder: (context) {
                          return HomeBottomSheet(book);
                        });
                  },
                  child: Image.network(book.image));
            },
          ),
        ));
  }
}
