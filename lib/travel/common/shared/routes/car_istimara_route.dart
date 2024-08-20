


import 'package:api_controller/route/routing_config.dart';
import 'package:tanfeth_apps/flavor/flavor_config.dart';
import 'package:tanfeth_apps/flavor/init_binding.dart';
import 'package:tanfeth_apps/travel/taxi24/taxi24_driver/presentation/view/car_istimara/car_istimara_view.dart';

class CarIstimaraRouting extends RoutingConfig {
  CarIstimaraRouting();

  static const String _path = '/CarIstimara/';
  static const String pageType = '/pageType/';


  static RoutingConfig config() {
    switch (customAppFlavor.appNameEnum) {
      case AppNameEnum.taxi24Driver:
        return RoutingConfig(path: _path, widget: const  CarIstimaraView());
      default:
        return RoutingConfig(path: _path, widget: const CarIstimaraView());
    }
  }
}





