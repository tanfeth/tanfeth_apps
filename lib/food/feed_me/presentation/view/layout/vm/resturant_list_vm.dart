

import 'package:flutter_riverpod/flutter_riverpod.dart';


var restaurantListProvider = StateNotifierProvider<RestaurantListVM, bool>((ref) {

  return RestaurantListVM();
});



class RestaurantListVM extends StateNotifier<bool>{
  RestaurantListVM() : super(true);


  void  changeLoading({required bool loading}){
    state = loading;
  }


}