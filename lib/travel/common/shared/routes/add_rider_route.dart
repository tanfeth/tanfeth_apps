




import 'package:api_controller/route/routing_config.dart';
import 'package:tanfeth_apps/flavor/flavor_config.dart';
import 'package:tanfeth_apps/flavor/init_binding.dart';
import 'package:tanfeth_apps/travel/taxi24/taxi24_passenger/presentation/view/add_rider/add_rider_view.dart';

class AddRiderRouting extends RoutingConfig {
  AddRiderRouting();

  static const String _path = '/AddRider/';


  static RoutingConfig config() {
    switch (customAppFlavor.appNameEnum) {
      case AppNameEnum.taxi24Driver:
        return RoutingConfig(path: _path, widget: const AddRiderView());
      default:
        return RoutingConfig(path: _path, widget: const AddRiderView());
    }
  }
}

