


import 'package:tanfeth_apps/common/shared/routing/routing_config.dart';
import 'package:tanfeth_apps/flavor/flavor_config.dart';
import 'package:tanfeth_apps/flavor/init_binding.dart';
import 'package:tanfeth_apps/travel/taxi24/taxi24_passenger/presentation/view/set_location_on_map/set_location_on_map_view.dart';

class SetLocationOnMapRouting extends RoutingConfig {
  SetLocationOnMapRouting();

  static const String _path = '/SetLocationOnMap/';
  static const String pageType = 'pageType';

  static RoutingConfig config() {
    switch (customAppFlavor.appNameEnum) {
      case AppNameEnum.taxi24Driver:
        return RoutingConfig(path: _path, widget: const SetLocationOnMapView());
      default:
        return RoutingConfig(path: _path, widget: const SetLocationOnMapView());
    }
  }
}

