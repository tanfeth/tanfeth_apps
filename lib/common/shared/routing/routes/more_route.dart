




import 'package:api_controller/route/routing_config.dart';
import 'package:tanfeth_apps/flavor/flavor_config.dart';
import 'package:tanfeth_apps/flavor/init_binding.dart';
import 'package:tanfeth_apps/food/feed_me/presentation/view/more/more_view.dart';

class MoreRouting extends RoutingConfig {
  MoreRouting();

  static const String _path = '/More/';


  static RoutingConfig config() {
    switch (customAppFlavor.appNameEnum) {
      case AppNameEnum.taxi24Driver:
        return RoutingConfig(path: _path, widget: const MoreView());
      case AppNameEnum.feedMe:
        return RoutingConfig(path: _path, widget: const MoreView());
      default:
        return RoutingConfig(path: _path, widget: const MoreView());
    }
  }
}