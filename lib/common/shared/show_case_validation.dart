

import 'package:get/get.dart';
import 'package:tanfeth_apps/common/shared/routing/routes/layout_route.dart';
import 'package:tanfeth_apps/common/shared/routing/routes/profile_routing.dart';
import 'package:tanfeth_apps/common/shared/storage.dart';


void setTaxi24DriverShowCase({required int index }){
  if(Get.currentRoute == LayoutRouting.config().path && index == 2){
    AppStorage.showHomeCase(false);
  }else if(Get.currentRoute == ProfileRouting.config().path && index == 6){
    AppStorage.showProfileCase(false);
  }
}



void setTaxi24PassengerShowCase({required int index }){
  // if(Get.currentRoute == LayoutRouting.config().path && index == 15){
  //   AppStorage.showHomeCase(false);
  // }else if(Get.currentRoute == ProfileRouting.config().path && index == 6){
  //   AppStorage.showProfileCase(false);
  // }
}