

import 'package:flutter_riverpod/flutter_riverpod.dart';


var feedMeOrderTypeProvider = StateNotifierProvider<FeedMeOrderTypeVM, int>((ref) {
  return FeedMeOrderTypeVM();
});


var feedMeDeliveryTimeProvider = StateNotifierProvider<FeedMeOrderTypeVM, int>((ref) {
  return FeedMeOrderTypeVM();
});



class FeedMeOrderTypeVM extends StateNotifier<int>{
  FeedMeOrderTypeVM() : super(0){
    reInitIndex();
  }

  void  changeIndex({required int currentIndex}){
    state = currentIndex;
  }


  void reInitIndex(){
    state = 0;
  }
}