
import 'package:api_controller/route/routing_config.dart';
import 'package:tanfeth_apps/flavor/flavor_config.dart';
import 'package:tanfeth_apps/flavor/init_binding.dart';
import 'package:tanfeth_apps/food/feed_me/presentation/view/map/map_view.dart';
import 'package:tanfeth_apps/food/feed_me/presentation/view/restaurant/restuarant_profile.dart';


class RestaurantProfileRouting extends RoutingConfig {
  RestaurantProfileRouting();

  static const String _path = '/RestaurantProfile/';



  static RoutingConfig config() {
    switch (customAppFlavor.appNameEnum) {
      case AppNameEnum.taxi24Driver:
        return RoutingConfig(path: _path, widget: const RestaurantProfileView());
      case AppNameEnum.feedMe:
        return RoutingConfig(path: _path, widget: const RestaurantProfileView());

      default:
        return RoutingConfig(path: _path, widget: const RestaurantProfileView());
    }
  }
}

