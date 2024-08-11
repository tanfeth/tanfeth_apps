




import 'package:api_controller/route/routing_config.dart';
import 'package:tanfeth_apps/flavor/flavor_config.dart';
import 'package:tanfeth_apps/flavor/init_binding.dart';
import 'package:tanfeth_apps/food/feed_me/presentation/view/cart/cart_view.dart';
import 'package:tanfeth_apps/food/feed_me/presentation/view/complain_and_suggest/complain_and_suggest_view.dart';

class ComplainAndSuggestRouting extends RoutingConfig {
  ComplainAndSuggestRouting();

  static const String _path = '/ComplainAndSuggest/';


  static RoutingConfig config() {
    switch (customAppFlavor.appNameEnum) {
      case AppNameEnum.taxi24Driver:
        return RoutingConfig(path: _path, widget: const ComplainAndSuggestView());
      case AppNameEnum.feedMe:
        return RoutingConfig(path: _path, widget: const ComplainAndSuggestView());
      default:
        return RoutingConfig(path: _path, widget: const ComplainAndSuggestView());
    }
  }
}