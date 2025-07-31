import 'package:flutter_book_search_app/ui/home/home_view_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test(
    'HomeviewModeltest',
    () async {
      //프로바이더스코프안에서 뷰모델관리
      //테스트환경에서 위젯을 생성하지 않고 테스트 할 수 있게 제공
      final providerContainer = ProviderContainer();
      addTearDown(providerContainer.dispose);
      final homeVm = providerContainer.read(homeviewModelProvider.notifier);
      //처음 홈 뷰모델의 상태 => 빈 리스트 인걸 테스트
      final firstState = providerContainer.read(homeviewModelProvider);
      expect(firstState.books.isEmpty, true);
      //홈뷰모델에서 서치북스에서 메서드 호출 후 상태가 변경이 정상적으로 되는지 테스트
      homeVm.searchBooks('harry');
      final afterState = providerContainer.read(homeviewModelProvider);
      expect(afterState.books.isEmpty, true);

      afterState.books.forEach(
        (element) {
          print(element.toJson());
        },
      );
    },
  );
}
