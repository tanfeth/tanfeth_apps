


import 'package:tanfeth_apps/common/shared/routing/routing_config.dart';
import 'package:tanfeth_apps/flavor/flavor_config.dart';
import 'package:tanfeth_apps/flavor/init_binding.dart';
import 'package:tanfeth_apps/travel/taxi24/taxi24_passenger/presentation/view/my_trip/passenger_my_trip_view.dart';

class MyTripRouting extends RoutingConfig {
  MyTripRouting();

  static const String _path = '/MyTrip/';


  static RoutingConfig config() {
    switch (customAppFlavor.appNameEnum) {
      case AppNameEnum.taxi24Driver:
        return RoutingConfig(path: _path, widget:  PassengerMyTripView());
      case AppNameEnum.taxi24Passenger:
        return RoutingConfig(path: _path, widget:  PassengerMyTripView());
      default:
        return RoutingConfig(path: _path, widget:  PassengerMyTripView());
    }
  }
}



