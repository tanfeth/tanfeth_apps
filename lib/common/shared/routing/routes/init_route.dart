


import 'package:tanfeth_apps/common/presentation/view/splash/loading_view.dart';
import 'package:api_controller/route/routing_config.dart';


class InitRouting {
  const InitRouting();

  static  RoutingConfig config() => RoutingConfig(
    path: "/init",
     widget: LoadingView(),
    ///Todo change route
   // widget: PassengerWalletView(),
  );
}


