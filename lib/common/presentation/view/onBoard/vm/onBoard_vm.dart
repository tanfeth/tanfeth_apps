
import 'package:flutter_riverpod/flutter_riverpod.dart';


var onBoardProvider = StateNotifierProvider<OnBoardVM, int>((ref) {
  return OnBoardVM();
});

class OnBoardVM extends StateNotifier<int>{
  OnBoardVM() : super(0){
    reInitIndex();
  }

 void  changePageIndex({required int currentIndex}){
    state = currentIndex;
  }


  void reInitIndex(){
    state = 0;
  }
}