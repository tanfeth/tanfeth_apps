
import 'package:tanfeth_apps/common/shared/routing/routing_config.dart';
import 'package:tanfeth_apps/flavor/flavor_config.dart';
import 'package:tanfeth_apps/flavor/init_binding.dart';
import 'package:tanfeth_apps/travel/taxi24/taxi24_driver/presentation/view/add_car/add_car_view.dart';
import 'package:tanfeth_apps/travel/taxi24/taxi24_driver/presentation/view/cars/cars_view.dart';
import 'package:tanfeth_apps/travel/taxi24/taxi24_passenger/presentation/view/complete_trip/complete_trip_view.dart';

class CompleteTripRouting extends RoutingConfig {
  CompleteTripRouting();

  static const String _path = '/CompleteTripView/';


  static RoutingConfig config() {
    switch (customAppFlavor.appNameEnum) {
      case AppNameEnum.taxi24Driver:
        return RoutingConfig(path: _path, widget: const CompleteTripView());
      default:
        return RoutingConfig(path: _path, widget: const CompleteTripView());
    }
  }
}

