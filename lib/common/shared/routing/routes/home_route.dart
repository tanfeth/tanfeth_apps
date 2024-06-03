



import 'package:tanfeth_apps/common/shared/routing/routing_config.dart';
import 'package:tanfeth_apps/flavor/flavor_config.dart';
import 'package:tanfeth_apps/flavor/init_binding.dart';
import 'package:tanfeth_apps/travel/taxi24/taxi24_driver/presentation/view/home/home_view.dart';

class HomeRouting extends RoutingConfig {
  HomeRouting();

  static const String _path = '/Home/';


  static RoutingConfig config() {
    switch (customAppFlavor.appNameEnum) {
      case AppNameEnum.taxi24Driver:
        return RoutingConfig(path: _path, widget: const TaxiDriverHomeView());
      default:
        return RoutingConfig(path: _path, widget: const TaxiDriverHomeView());
    }
  }
}