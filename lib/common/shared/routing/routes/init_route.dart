


import 'package:tanfeth_apps/common/presentation/view/splash/loading_view.dart';
import 'package:tanfeth_apps/common/shared/routing/routing_config.dart';

class InitRouting {
  const InitRouting();

  static  ScreenConfig config() => ScreenConfig(
    path: "/init",
    widget: LoadingView(),
  );
}


