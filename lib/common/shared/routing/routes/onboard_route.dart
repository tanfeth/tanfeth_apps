

import 'package:tanfeth_apps/common/presentation/view/onBoard/onBoard_view.dart';
import 'package:api_controller/route/routing_config.dart';
import 'package:tanfeth_apps/flavor/flavor_config.dart';
import 'package:tanfeth_apps/flavor/init_binding.dart';

class OnBoardingRouting   {
  OnBoardingRouting();

  static const String _path = '/OnBoarding/';

  static RoutingConfig config() {
    switch (customAppFlavor.appNameEnum) {
      case AppNameEnum.taxi24Driver:
        return RoutingConfig(path: _path,
            widget: const OnBoardingView());

      default:
        return RoutingConfig(path: _path,
            widget: const OnBoardingView());
    }
  }
}