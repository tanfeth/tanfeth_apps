
import 'package:api_controller/route/routing_config.dart';
import 'package:tanfeth_apps/flavor/flavor_config.dart';
import 'package:tanfeth_apps/flavor/init_binding.dart';
import 'package:tanfeth_apps/travel/taxi24/taxi24_driver/presentation/view/profile/driver_profile_view.dart';
import 'package:tanfeth_apps/travel/taxi24/taxi24_passenger/presentation/view/profile/passenger_profile_view.dart';

class ProfileRouting extends RoutingConfig {
  ProfileRouting();

  static const String _path = '/Profile/';

  static RoutingConfig config() {
    switch (customAppFlavor.appNameEnum) {
      case AppNameEnum.taxi24Driver:
        return RoutingConfig(path: _path, widget: const TaxiDriverProfile());
        case AppNameEnum.taxi24Passenger:
          return RoutingConfig(path: _path, widget: const TaxiPassengerProfileView());
      case AppNameEnum.feedMe:
        return RoutingConfig(path: _path, widget: const TaxiPassengerProfileView());

      default:
        return RoutingConfig(path: _path, widget: const TaxiDriverProfile());
    }
  }
}

