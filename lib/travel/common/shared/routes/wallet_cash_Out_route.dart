



import 'package:api_controller/route/routing_config.dart';
import 'package:tanfeth_apps/flavor/flavor_config.dart';
import 'package:tanfeth_apps/flavor/init_binding.dart';
import 'package:tanfeth_apps/travel/taxi24/taxi24_driver/presentation/view/wallet_cash_out/wallet_cash_out_view.dart';

class WalletCashOutRouting extends RoutingConfig {
  WalletCashOutRouting();

  static const String _path = '/WalletCashOut/';


  static RoutingConfig config() {
    switch (customAppFlavor.appNameEnum) {
      case AppNameEnum.taxi24Driver:
        return RoutingConfig(path: _path, widget: const WalletCashOutView());
      default:
        return RoutingConfig(path: _path, widget: const WalletCashOutView());
    }
  }
}




