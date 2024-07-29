
import 'package:api_controller/route/routing_config.dart';
import 'package:tanfeth_apps/flavor/flavor_config.dart';
import 'package:tanfeth_apps/flavor/init_binding.dart';
import 'package:tanfeth_apps/travel/common/presentation/view/auth/verify/verify_view.dart';



class VerifyRouting  {
  VerifyRouting();

  static const String _path = '/Verify/';
  static const String phone = 'phone';
  static const String pageType = 'pageType';

  static RoutingConfig config() {
    switch (customAppFlavor.appNameEnum) {
      case AppNameEnum.taxi24Driver:
        return RoutingConfig(path: _path, widget: const VerifyView());
      default:
        return RoutingConfig(path: _path, widget: const VerifyView(),);
    }
  }
}