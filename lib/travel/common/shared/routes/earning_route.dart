


import 'package:tanfeth_apps/common/shared/routing/routing_config.dart';
import 'package:tanfeth_apps/flavor/flavor_config.dart';
import 'package:tanfeth_apps/flavor/init_binding.dart';
import 'package:tanfeth_apps/travel/taxi24/taxi24_driver/presentation/view/earning/earning_view.dart';

class EarningRouting extends RoutingConfig {
  EarningRouting();

  static const String _path = '/Earning/';


  static RoutingConfig config() {
    switch (customAppFlavor.appNameEnum) {
      case AppNameEnum.taxi24Driver:
        return RoutingConfig(path: _path, widget: const EarningView());
      default:
        return RoutingConfig(path: _path, widget: const EarningView());
    }
  }
}



