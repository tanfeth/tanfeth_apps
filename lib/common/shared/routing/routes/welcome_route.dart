


import 'package:tanfeth_apps/common/shared/routing/routing_config.dart';
import 'package:tanfeth_apps/flavor/flavor_config.dart';
import 'package:tanfeth_apps/flavor/init_binding.dart';
import 'package:tanfeth_apps/travel/common/presentation/welcome/welcome_view.dart';

class WelcomeRouting   {
  WelcomeRouting();

  static const String _path = '/welcome/';

  static RoutingConfig config() {
    switch (customAppFlavor.appNameEnum) {
      case AppNameEnum.taxi24Driver:
        return RoutingConfig(path: _path,
            widget: const WelcomeView());

      default:
        return RoutingConfig(path: _path,
            widget: const WelcomeView());
    }
  }
}
