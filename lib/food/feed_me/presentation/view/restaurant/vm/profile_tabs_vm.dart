
import 'package:flutter_riverpod/flutter_riverpod.dart';


var feedMeProfileTabsProvider = StateNotifierProvider<FeedMeProfileTabsVM, int>((ref) {
  return FeedMeProfileTabsVM();
});

class FeedMeProfileTabsVM extends StateNotifier<int>{
  FeedMeProfileTabsVM() : super(0){
    reInitIndex();
  }

  void  changeTabIndex({required int currentIndex}){
    state = currentIndex;
  }


  void reInitIndex(){
    state = 0;
  }
}