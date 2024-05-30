


import 'package:tanfeth_apps/common/shared/routing/routing_config.dart';
import 'package:tanfeth_apps/flavor/flavor_config.dart';
import 'package:tanfeth_apps/flavor/init_binding.dart';
import 'package:tanfeth_apps/travel/taxi24/taxi24_driver/presentation/view/welcome/welcome_view.dart';

class WelcomeRouting   {
  WelcomeRouting();

  static const String _path = '/welcome/';

  static ScreenConfig config() {
    switch (customAppFlavor.appNameEnum) {
      case AppNameEnum.taxi24Driver:
        return ScreenConfig(path: _path,
            widget: const WelcomeView());

      default:
        return ScreenConfig(path: _path,
            widget: const WelcomeView());
    }
  }
}
