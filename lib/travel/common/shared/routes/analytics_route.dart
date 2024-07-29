
import 'package:api_controller/route/routing_config.dart';
import 'package:tanfeth_apps/flavor/flavor_config.dart';
import 'package:tanfeth_apps/flavor/init_binding.dart';
import 'package:tanfeth_apps/travel/taxi24/taxi24_driver/presentation/view/analytics/analytics_view.dart';

class AnalyticsRouting extends RoutingConfig {
  AnalyticsRouting();

  static const String _path = '/Analytics/';
  static const String index = 'index';

  static RoutingConfig config() {
    switch (customAppFlavor.appNameEnum) {
      case AppNameEnum.taxi24Driver:
        return RoutingConfig(path: _path, widget: const AnalyticsView());
      default:
        return RoutingConfig(path: _path, widget: const AnalyticsView());
    }
  }
}

