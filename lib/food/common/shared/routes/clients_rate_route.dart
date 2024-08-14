
import 'package:api_controller/route/routing_config.dart';
import 'package:tanfeth_apps/flavor/flavor_config.dart';
import 'package:tanfeth_apps/flavor/init_binding.dart';
import 'package:tanfeth_apps/food/feed_me/presentation/view/clients_rate/clients_rate_view.dart';
import 'package:tanfeth_apps/food/feed_me/presentation/view/map/map_view.dart';


class ClientsRateRouting extends RoutingConfig {
  ClientsRateRouting();

  static const String _path = '/ClientsRate/';



  static RoutingConfig config() {
    switch (customAppFlavor.appNameEnum) {
      case AppNameEnum.taxi24Driver:
        return RoutingConfig(path: _path, widget: const ClientsRateView());
      case AppNameEnum.feedMe:
        return RoutingConfig(path: _path, widget: const ClientsRateView());

      default:
        return RoutingConfig(path: _path, widget: const ClientsRateView());
    }
  }
}

