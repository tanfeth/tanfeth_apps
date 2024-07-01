


import 'package:tanfeth_apps/common/presentation/view/splash/splash_view.dart';
import 'package:tanfeth_apps/common/shared/routing/routing_config.dart';
import 'package:tanfeth_apps/flavor/flavor_config.dart';
import 'package:tanfeth_apps/flavor/init_binding.dart';
import 'package:tanfeth_apps/travel/taxi24/taxi24_passenger/presentation/view/splash/splash_view.dart';

import '../../../../travel/taxi24/taxi24_passenger/presentation/view/profile/passenger_profile_view.dart';

class SplashRouting {
  SplashRouting();

  static const String _path = '/Splash/';

  static RoutingConfig config() {
    switch (customAppFlavor.appNameEnum) {
      case AppNameEnum.taxi24Driver:
        return RoutingConfig(path: _path, widget: const SplashView());
      case AppNameEnum.taxi24Passenger:
        //todo
        return RoutingConfig(path: _path, widget: const TaxiPassengerProfileView());

      default:
        return RoutingConfig(path: _path, widget: const SplashView());
    }
  }

}

