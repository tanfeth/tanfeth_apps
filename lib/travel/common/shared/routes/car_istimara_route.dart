


import 'package:tanfeth_apps/common/shared/routing/routing_config.dart';
import 'package:tanfeth_apps/flavor/flavor_config.dart';
import 'package:tanfeth_apps/flavor/init_binding.dart';
import 'package:tanfeth_apps/travel/taxi24/taxi24_driver/presentation/view/add_car/add_car_view.dart';
import 'package:tanfeth_apps/travel/taxi24/taxi24_driver/presentation/view/car_details/car_details_view.dart';
import 'package:tanfeth_apps/travel/taxi24/taxi24_driver/presentation/view/car_istimara/car_istimara_view.dart';
import 'package:tanfeth_apps/travel/taxi24/taxi24_driver/presentation/view/cars/cars_view.dart';

class CarIstimaraRouting extends RoutingConfig {
  CarIstimaraRouting();

  static const String _path = '/CarIstimara/';

  static RoutingConfig config() {
    switch (customAppFlavor.appNameEnum) {
      case AppNameEnum.taxi24Driver:
        return RoutingConfig(path: _path, widget: const  CarIstimaraView());
      default:
        return RoutingConfig(path: _path, widget: const CarIstimaraView());
    }
  }
}





