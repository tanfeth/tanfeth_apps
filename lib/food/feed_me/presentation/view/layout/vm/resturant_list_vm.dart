

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';


var restaurantListProvider = StateNotifierProvider<RestaurantListVM, bool>((ref) {

  return RestaurantListVM();
});



class RestaurantListVM extends StateNotifier<bool>{
  RestaurantListVM() : super(true);


    changeLoading({required bool loading}){
    WidgetsBinding.instance.addPostFrameCallback((_) {
      state = loading;
    });

  }


}