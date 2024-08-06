
import 'package:flutter_riverpod/flutter_riverpod.dart';


var feedMeBottomBarProvider = StateNotifierProvider<FeedMeBottomBarVM, int>((ref) {
  return FeedMeBottomBarVM();
});

class FeedMeBottomBarVM extends StateNotifier<int>{
  FeedMeBottomBarVM() : super(0){
    reInitIndex();
  }

  void  changePageIndex({required int currentIndex}){
    state = currentIndex;
  }


  void reInitIndex(){
    state = 0;
  }
}