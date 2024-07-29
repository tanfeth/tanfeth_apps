

import 'package:api_controller/route/routing_config.dart';
import 'package:tanfeth_apps/flavor/flavor_config.dart';
import 'package:tanfeth_apps/flavor/init_binding.dart';
import 'package:tanfeth_apps/travel/taxi24/taxi24_driver/presentation/view/bank/bank_view.dart';

class BankRouting extends RoutingConfig {
  BankRouting();

  static const String _path = '/Bank/';


  static RoutingConfig config() {
    switch (customAppFlavor.appNameEnum) {
      case AppNameEnum.taxi24Driver:
        return RoutingConfig(path: _path, widget: const BankView());
      default:
        return RoutingConfig(path: _path, widget: const BankView());
    }
  }
}



