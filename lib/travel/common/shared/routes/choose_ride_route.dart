

import 'package:tanfeth_apps/common/shared/routing/routing_config.dart';
import 'package:tanfeth_apps/flavor/flavor_config.dart';
import 'package:tanfeth_apps/flavor/init_binding.dart';
import 'package:tanfeth_apps/travel/taxi24/taxi24_passenger/presentation/view/choose_ride/choose_ride_view.dart';

class ChooseRideRouting extends RoutingConfig {
  ChooseRideRouting();

  static const String _path = '/ChooseRide/';
  static const String pickUpLatLng = '/pickUpLatLng/';


  static RoutingConfig config() {
    switch (customAppFlavor.appNameEnum) {
      case AppNameEnum.taxi24Driver:
        return RoutingConfig(path: _path, widget: const ChooseRideView());
      default:
        return RoutingConfig(path: _path, widget: const ChooseRideView());
    }
  }
}




