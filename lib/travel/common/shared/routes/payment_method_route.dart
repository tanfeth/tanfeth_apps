


import 'package:tanfeth_apps/common/shared/routing/routing_config.dart';
import 'package:tanfeth_apps/flavor/flavor_config.dart';
import 'package:tanfeth_apps/flavor/init_binding.dart';
import 'package:tanfeth_apps/travel/taxi24/taxi24_driver/presentation/view/payment_method/payment_method_view.dart';
import 'package:tanfeth_apps/travel/taxi24/taxi24_passenger/presentation/view/payment_method/payment_method_view.dart';

class PaymentMethodRouting extends RoutingConfig {
  PaymentMethodRouting();

  static const String _path = '/PaymentMethod/';


  static RoutingConfig config() {
    switch (customAppFlavor.appNameEnum) {
      case AppNameEnum.taxi24Driver:
        return RoutingConfig(path: _path, widget: const PaymentMethodView());
      default:
        return RoutingConfig(path: _path, widget: const TaxiPassengerPaymentMethodView());
    }
  }
}




