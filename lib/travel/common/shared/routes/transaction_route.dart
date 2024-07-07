


import 'package:tanfeth_apps/common/shared/routing/routing_config.dart';
import 'package:tanfeth_apps/flavor/flavor_config.dart';
import 'package:tanfeth_apps/flavor/init_binding.dart';
import 'package:tanfeth_apps/travel/taxi24/taxi24_passenger/presentation/view/transactions/transactions_view.dart';

class TransactionRouting extends RoutingConfig {
  TransactionRouting();

  static const String _path = '/Transaction/';


  static RoutingConfig config() {
    switch (customAppFlavor.appNameEnum) {
      case AppNameEnum.taxi24Driver:
        return RoutingConfig(path: _path, widget:  Transactions());
      case AppNameEnum.taxi24Passenger:
        return RoutingConfig(path: _path, widget:  Transactions());
      default:
        return RoutingConfig(path: _path, widget:  Transactions());
    }
  }
}



