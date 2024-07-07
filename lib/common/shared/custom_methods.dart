
import 'package:get/get.dart';
import 'package:tanfeth_apps/common/shared/routing/routes/home_route.dart';
import 'package:tanfeth_apps/common/shared/routing/routes/layout_route.dart';
import 'package:tanfeth_apps/common/shared/routing/routes/profile_routing.dart';
import 'package:tanfeth_apps/common/shared/storage.dart';
import 'package:tanfeth_apps/flavor/init_binding.dart';
import 'package:tanfeth_apps/flavor/flavor_config.dart';



bool get isTaxi24Driver => customAppFlavor.appNameEnum ==
    AppNameEnum.taxi24Driver;

bool get isTaxi24Passenger => customAppFlavor.appNameEnum ==
    AppNameEnum.taxi24Passenger;


void checkCaseStatus({int? index}) {
  switch (customAppFlavor.appNameEnum) {
    case AppNameEnum.taxi24Driver:
       if(Get.currentRoute == LayoutRouting.config().path && index == 2){
         AppStorage.showHomeCase(false);
       }else if(Get.currentRoute == ProfileRouting.config().path && index == 6){
         AppStorage.showProfileCase(false);
       }
    case AppNameEnum.taxi24Passenger:
      if(Get.currentRoute == LayoutRouting.config().path && index == 15){
        AppStorage.showHomeCase(false);
      }else if(Get.currentRoute == ProfileRouting.config().path && index == 6){
        AppStorage.showProfileCase(false);
      }
      default:
        if(Get.currentRoute == HomeRouting.config().path && index == 2){
          AppStorage.showHomeCase(false);
        }else if(Get.currentRoute == ProfileRouting.config().path && index == 6){
          AppStorage.showProfileCase(false);
        }
  }
}
