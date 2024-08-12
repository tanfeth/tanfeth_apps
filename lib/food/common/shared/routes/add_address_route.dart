
import 'package:api_controller/route/routing_config.dart';
import 'package:tanfeth_apps/flavor/flavor_config.dart';
import 'package:tanfeth_apps/flavor/init_binding.dart';
import 'package:tanfeth_apps/food/feed_me/presentation/view/address/add_address_view.dart';


class AddAddressRouting extends RoutingConfig {
  AddAddressRouting();

  static const String _path = '/AddAddress/';
  static const String pageType = 'pageType';


  static RoutingConfig config() {
    switch (customAppFlavor.appNameEnum) {
      case AppNameEnum.taxi24Driver:
        return RoutingConfig(path: _path, widget: const AddAddressView());
      case AppNameEnum.feedMe:
        return RoutingConfig(path: _path, widget: const AddAddressView());

      default:
        return RoutingConfig(path: _path, widget: const AddAddressView());
    }
  }
}

