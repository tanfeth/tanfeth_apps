


import 'package:api_controller/route/routing_config.dart';
import 'package:tanfeth_apps/flavor/flavor_config.dart';
import 'package:tanfeth_apps/flavor/init_binding.dart';
import 'package:tanfeth_apps/travel/taxi24/taxi24_driver/presentation/view/bank/bank_view.dart';
import 'package:tanfeth_apps/travel/taxi24/taxi24_driver/presentation/view/terms_service/terms_service_view.dart';

class TermsOfServiceRouting extends RoutingConfig {
  TermsOfServiceRouting();

  static const String _path = '/TermsOfService/';


  static RoutingConfig config() {
    switch (customAppFlavor.appNameEnum) {
      case AppNameEnum.taxi24Driver:
        return RoutingConfig(path: _path, widget: const TermsServiceView());
      default:
        return RoutingConfig(path: _path, widget: const TermsServiceView());
    }
  }
}



