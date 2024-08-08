




import 'package:api_controller/route/routing_config.dart';
import 'package:tanfeth_apps/flavor/flavor_config.dart';
import 'package:tanfeth_apps/flavor/init_binding.dart';
import 'package:tanfeth_apps/food/feed_me/presentation/view/cart/cart_view.dart';

class CartRouting extends RoutingConfig {
  CartRouting();

  static const String _path = '/Cart/';


  static RoutingConfig config() {
    switch (customAppFlavor.appNameEnum) {
      case AppNameEnum.taxi24Driver:
        return RoutingConfig(path: _path, widget: const CartView());
      case AppNameEnum.feedMe:
        return RoutingConfig(path: _path, widget: const CartView());
      default:
        return RoutingConfig(path: _path, widget: const CartView());
    }
  }
}