


import 'package:tanfeth_apps/common/shared/routing/routing_config.dart';
import 'package:tanfeth_apps/flavor/flavor_config.dart';
import 'package:tanfeth_apps/flavor/init_binding.dart';
import 'package:tanfeth_apps/travel/taxi24/taxi24_driver/presentation/view/trips/trips_view.dart';

class TripsRouting extends RoutingConfig {
  TripsRouting();

  static const String _path = '/Trips/';
  static const String index = 'index';


  static RoutingConfig config() {
    switch (customAppFlavor.appNameEnum) {
      case AppNameEnum.taxi24Driver:
        return RoutingConfig(path: _path, widget: const TripsView());
      default:
        return RoutingConfig(path: _path, widget: const TripsView());
    }
  }
}







