


import 'package:api_controller/route/routing_config.dart';
import 'package:tanfeth_apps/flavor/flavor_config.dart';
import 'package:tanfeth_apps/flavor/init_binding.dart';
import 'package:tanfeth_apps/travel/taxi24/taxi24_passenger/presentation/view/add_funds/add_fund_view.dart';

class AddFundsRouting extends RoutingConfig {
  AddFundsRouting();

  static const String _path = '/AddFunds/';

  static RoutingConfig config() {
    switch (customAppFlavor.appNameEnum) {
      case AppNameEnum.taxi24Driver:
        return RoutingConfig(path: _path, widget:  AddFunds());
      case AppNameEnum.taxi24Passenger:
        return RoutingConfig(path: _path, widget:  AddFunds());
      default:
        return RoutingConfig(path: _path, widget:  AddFunds());
    }
  }
}



