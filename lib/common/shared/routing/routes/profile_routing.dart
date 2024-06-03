
import 'package:tanfeth_apps/common/shared/routing/routing_config.dart';
import 'package:tanfeth_apps/flavor/flavor_config.dart';
import 'package:tanfeth_apps/flavor/init_binding.dart';
import 'package:tanfeth_apps/travel/taxi24/taxi24_driver/presentation/view/profile/profile_view.dart';

class ProfileRouting extends RoutingConfig {
  ProfileRouting();

  static const String _path = '/Profile/';


  static RoutingConfig config() {
    switch (customAppFlavor.appNameEnum) {
      case AppNameEnum.taxi24Driver:
        return RoutingConfig(path: _path, widget: const TaxiDriverProfile());
      default:
        return RoutingConfig(path: _path, widget: const TaxiDriverProfile());
    }
  }
}

