


import 'package:tanfeth_apps/common/presentation/view/splash/splash_view.dart';
import 'package:tanfeth_apps/common/shared/routing/routing_config.dart';

class SplashRouting {
  SplashRouting();

  static RoutingConfig config() => RoutingConfig(
    path: "/loading/",
    widget: SplashView(),
  );
}

