


import 'package:api_controller/route/routing_config.dart';
import 'package:tanfeth_apps/flavor/flavor_config.dart';
import 'package:tanfeth_apps/flavor/init_binding.dart';
import 'package:tanfeth_apps/travel/common/presentation/view/auth/login/login_view.dart';



class LoginRouting  {
  LoginRouting();

  static const String _path = '/Login/';

  static RoutingConfig config() {
    switch (customAppFlavor.appNameEnum) {
      case AppNameEnum.taxi24Driver:
        return RoutingConfig(path: _path, widget: const TravelLoginView());
      default:
        return RoutingConfig(path: _path, widget: const TravelLoginView(),);
    }
  }
}