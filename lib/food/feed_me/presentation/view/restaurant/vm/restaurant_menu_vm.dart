

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';


var restaurantMenuListProvider = StateNotifierProvider<RestaurantMenuListVM, bool>((ref) {
  return RestaurantMenuListVM();
});



class RestaurantMenuListVM extends StateNotifier<bool>{
  RestaurantMenuListVM() : super(true);


  changeLoading({required bool loading}){
    WidgetsBinding.instance.addPostFrameCallback((_) {
      state = loading;
    });

  }


}