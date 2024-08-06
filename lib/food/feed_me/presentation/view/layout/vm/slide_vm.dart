
import 'package:flutter_riverpod/flutter_riverpod.dart';


var feedMeSlideProvider = StateNotifierProvider<FeedMeSlideVM, int>((ref) {
  return FeedMeSlideVM();
});

class FeedMeSlideVM extends StateNotifier<int>{
  FeedMeSlideVM() : super(0){
    reInitIndex();
  }

  void  changePageIndex({required int currentIndex}){
    state = currentIndex;
  }


  void reInitIndex(){
    state = 0;
  }
}