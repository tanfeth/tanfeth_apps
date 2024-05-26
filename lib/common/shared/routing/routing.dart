
import 'package:tanfeth_apps/common/presentation/view/splash/loading_view.dart';
import 'package:tanfeth_apps/common/presentation/view/splash/splash_view.dart';
import 'routing_config.dart';

class InitRouting {
  InitRouting();

  static ScreenConfig config() => ScreenConfig(
    path: "/init",
    widget: LoadingView(),
  );
}


class SplashRouting {
  SplashRouting();

  static ScreenConfig config() => ScreenConfig(
    path: "/loading/",
    widget: SplashView(),
  );
}





