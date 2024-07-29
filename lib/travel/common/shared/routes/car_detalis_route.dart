


import 'package:api_controller/route/routing_config.dart';
import 'package:tanfeth_apps/flavor/flavor_config.dart';
import 'package:tanfeth_apps/flavor/init_binding.dart';
import 'package:tanfeth_apps/travel/taxi24/taxi24_driver/presentation/view/add_car/add_car_view.dart';
import 'package:tanfeth_apps/travel/taxi24/taxi24_driver/presentation/view/car_details/car_details_view.dart';
import 'package:tanfeth_apps/travel/taxi24/taxi24_driver/presentation/view/cars/cars_view.dart';

class CarDetailsRouting extends RoutingConfig {
  CarDetailsRouting();

  static const String _path = '/CarDetails/';
  static const String  pageType = 'pageType';

  static RoutingConfig config() {
    switch (customAppFlavor.appNameEnum) {
      case AppNameEnum.taxi24Driver:
        return RoutingConfig(path: _path, widget: const CarDetailsView());
      default:
        return RoutingConfig(path: _path, widget: const CarDetailsView());
    }
  }
}





