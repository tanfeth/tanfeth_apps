

import 'package:api_controller/route/routing_config.dart';
import 'package:tanfeth_apps/flavor/flavor_config.dart';
import 'package:tanfeth_apps/flavor/init_binding.dart';
import 'package:tanfeth_apps/food/feed_me/presentation/view/layout/layout_view.dart';
import 'package:tanfeth_apps/travel/taxi24/taxi24_driver/presentation/view/driver_data/driver_data_view.dart';
import 'package:tanfeth_apps/travel/taxi24/taxi24_passenger/presentation/view/home/home_view.dart';


class LayoutRouting extends RoutingConfig {
  LayoutRouting();

  static const String _path = '/Layout/';
  static const String index = 'index';

  static RoutingConfig config() {
    switch (customAppFlavor.appNameEnum) {
      case AppNameEnum.taxi24Driver:
        return RoutingConfig(path: _path, widget: const DriverDataView()
        //const TaxiDriverHomeView()
    );
      case AppNameEnum.feedMe:
        return RoutingConfig(path: _path, widget: const FeedMeLayoutView()
          //const TaxiDriverHomeView()
        );

        default:
        return RoutingConfig(path: _path, widget: const TaxiPassengerHomeView());
    }
  }
}