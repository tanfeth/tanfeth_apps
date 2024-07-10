

import 'package:flutter_riverpod/flutter_riverpod.dart';



final searchingProvider = StateNotifierProvider.autoDispose<SearchingVM, int>((ref) {
  ref.keepAlive();
  return SearchingVM(0);
});

class SearchingVM extends StateNotifier<int> {

  SearchingVM(super.state);


  void changeCurrentIndex(int index) {
    if(state != index){
      state = index;
    }

  }

}