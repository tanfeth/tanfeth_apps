
import 'package:tanfeth_apps/common/shared/routing/routing_config.dart';
import 'package:tanfeth_apps/flavor/flavor_config.dart';
import 'package:tanfeth_apps/flavor/init_binding.dart';
import 'package:tanfeth_apps/travel/taxi24/taxi24_driver/presentation/view/account_status/account_status.dart';


class AccountStatusRouting extends RoutingConfig {
  AccountStatusRouting();

  static const String _path = '/AccountStatus/';
  static const String accountStatus = 'accountStatus';


  static RoutingConfig config() {
    switch (customAppFlavor.appNameEnum) {
      case AppNameEnum.taxi24Driver:
        return RoutingConfig(path: _path, widget: const AccountStatusView());
      default:
        return RoutingConfig(path: _path, widget: const AccountStatusView());
    }
  }
}

