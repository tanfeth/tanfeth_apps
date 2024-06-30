


import 'package:tanfeth_apps/common/shared/routing/routing_config.dart';
import 'package:tanfeth_apps/flavor/flavor_config.dart';
import 'package:tanfeth_apps/flavor/init_binding.dart';
import 'package:tanfeth_apps/travel/taxi24/taxi24_passenger/presentation/view/trip_details/trip_details.dart';

class TripDetailsRouting extends RoutingConfig {
  TripDetailsRouting();

  static const String _path = '/TripDetailsView/';
  static const String tripId = 'tripId';
  static const String orderTime = 'orderTime';

  static RoutingConfig config() {
    switch (customAppFlavor.appNameEnum) {
      case AppNameEnum.taxi24Driver:
        return RoutingConfig(path: _path, widget:  TripDetailsView());
      case AppNameEnum.taxi24Passenger:
        return RoutingConfig(path: _path, widget:  TripDetailsView());
      default:
        return RoutingConfig(path: _path, widget:  TripDetailsView());
    }
  }
}







