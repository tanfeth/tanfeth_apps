
import 'package:api_controller/route/routing_config.dart';
import 'package:tanfeth_apps/flavor/flavor_config.dart';
import 'package:tanfeth_apps/flavor/init_binding.dart';
import 'package:tanfeth_apps/travel/taxi24/taxi24_driver/presentation/view/cars/cars_view.dart';

class CarsRouting extends RoutingConfig {
  CarsRouting();

  static const String _path = '/Cars/';


  static RoutingConfig config() {
    switch (customAppFlavor.appNameEnum) {
      case AppNameEnum.taxi24Driver:
        return RoutingConfig(path: _path, widget: const TaxiDriverCarsView());
      default:
        return RoutingConfig(path: _path, widget: const TaxiDriverCarsView());
    }
  }
}

