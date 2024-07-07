

import 'package:flutter_riverpod/flutter_riverpod.dart';



final findDriverProvider = StateNotifierProvider<FindDriverVM, int>((ref) {
  return FindDriverVM(0);
});

class FindDriverVM extends StateNotifier<int> {

  FindDriverVM(int state) : super(state);


  void changeCurrentIndex(int index) {
    if(state != index){
      state = index;
    }

  }

}