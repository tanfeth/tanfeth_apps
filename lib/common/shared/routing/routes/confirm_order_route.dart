




import 'package:api_controller/route/routing_config.dart';
import 'package:tanfeth_apps/flavor/flavor_config.dart';
import 'package:tanfeth_apps/flavor/init_binding.dart';
import 'package:tanfeth_apps/food/feed_me/presentation/view/cart/cart_view.dart';
import 'package:tanfeth_apps/food/feed_me/presentation/view/confirm_order/confirm_order_view.dart';

class ConfirmOrderRouting extends RoutingConfig {
  ConfirmOrderRouting();

  static const String _path = '/ConfirmOrder/';


  static RoutingConfig config() {
    switch (customAppFlavor.appNameEnum) {
      case AppNameEnum.taxi24Driver:
        return RoutingConfig(path: _path, widget: const ConfirmOrderView());
      case AppNameEnum.feedMe:
        return RoutingConfig(path: _path, widget: const ConfirmOrderView());
      default:
        return RoutingConfig(path: _path, widget: const ConfirmOrderView());
    }
  }
}