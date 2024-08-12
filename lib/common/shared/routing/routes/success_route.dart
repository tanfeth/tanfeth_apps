




import 'package:api_controller/route/routing_config.dart';
import 'package:tanfeth_apps/flavor/flavor_config.dart';
import 'package:tanfeth_apps/flavor/init_binding.dart';
import 'package:tanfeth_apps/food/feed_me/presentation/view/cart/cart_view.dart';
import 'package:tanfeth_apps/food/feed_me/presentation/view/success/success_view.dart';

class SuccessRouting extends RoutingConfig {
  SuccessRouting();

  static const String _path = '/FeedMeSuccess/';


  static RoutingConfig config() {
    switch (customAppFlavor.appNameEnum) {
      case AppNameEnum.taxi24Driver:
        return RoutingConfig(path: _path, widget: const FeedMeSuccessView());
      case AppNameEnum.feedMe:
        return RoutingConfig(path: _path, widget: const FeedMeSuccessView());
      default:
        return RoutingConfig(path: _path, widget: const FeedMeSuccessView());
    }
  }
}