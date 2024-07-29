



import 'package:api_controller/route/routing_config.dart';
import 'package:tanfeth_apps/flavor/flavor_config.dart';
import 'package:tanfeth_apps/flavor/init_binding.dart';
import 'package:tanfeth_apps/travel/taxi24/taxi24_driver/presentation/view/driver_data/driver_data_view.dart';

class DriverDataRouting extends RoutingConfig {
  DriverDataRouting();

  static const String _path = '/DriverData/';


  static RoutingConfig config() {
    switch (customAppFlavor.appNameEnum) {
      case AppNameEnum.taxi24Driver:
        return RoutingConfig(path: _path, widget: const DriverDataView());
      default:
        return RoutingConfig(path: _path, widget: const DriverDataView());
    }
  }
}






