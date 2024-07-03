


import 'package:tanfeth_apps/common/shared/routing/routing_config.dart';
import 'package:tanfeth_apps/flavor/flavor_config.dart';
import 'package:tanfeth_apps/flavor/init_binding.dart';
import 'package:tanfeth_apps/travel/taxi24/taxi24_driver/presentation/view/cars/cars_view.dart';
import 'package:tanfeth_apps/travel/taxi24/taxi24_driver/presentation/view/wallet/wallet_view.dart';
import 'package:tanfeth_apps/travel/taxi24/taxi24_passenger/presentation/view/wallet/passenger_wallet_view.dart';

class WalletRouting extends RoutingConfig {
  WalletRouting();

  static const String _path = '/Wallet/';


  static RoutingConfig config() {
    switch (customAppFlavor.appNameEnum) {
      case AppNameEnum.taxi24Driver:
        return RoutingConfig(path: _path, widget: const WalletView());
      case AppNameEnum.taxi24Passenger:
        return RoutingConfig(path: _path, widget: const PassengerWalletView());
      default:
        return RoutingConfig(path: _path, widget: const WalletView());
    }
  }
}




