

import 'package:tanfeth_apps/common/presentation/view/onBoard/onBoard_view.dart';
import 'package:api_controller/route/routing_config.dart';
import 'package:tanfeth_apps/flavor/flavor_config.dart';
import 'package:tanfeth_apps/flavor/init_binding.dart';
import 'package:tanfeth_apps/food/feed_me/presentation/view/onBoard/onBoard_view.dart';

class OnBoardingRouting   {
  OnBoardingRouting();

  static const String _path = '/OnBoarding/';

  static RoutingConfig config() {
    switch (customAppFlavor.appNameEnum) {
      case AppNameEnum.taxi24Driver:
        return RoutingConfig(path: _path,
            widget: const OnBoardingView());
      case AppNameEnum.feedMe:
        return RoutingConfig(path: _path,
            widget: const FeedMeOnBoardingView());
      default:
        return RoutingConfig(path: _path,
            widget: const OnBoardingView());
    }
  }
}