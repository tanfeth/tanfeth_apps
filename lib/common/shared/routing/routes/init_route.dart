


import 'package:tanfeth_apps/common/presentation/view/splash/loading_view.dart';
import 'package:tanfeth_apps/common/shared/routing/routing_config.dart';

import '../../../../travel/taxi24/taxi24_passenger/presentation/view/profile/passenger_profile_view.dart';
import '../../../../travel/taxi24/taxi24_passenger/presentation/view/wallet/passenger_wallet_view.dart';

class InitRouting {
  const InitRouting();

  static  RoutingConfig config() => RoutingConfig(
    path: "/init",
     widget: LoadingView(),
    ///Todo change route
   // widget: PassengerWalletView(),
  );
}


