
import 'package:api_controller/route/routing_config.dart';
import 'package:tanfeth_apps/flavor/flavor_config.dart';
import 'package:tanfeth_apps/flavor/init_binding.dart';
import 'package:tanfeth_apps/food/feed_me/presentation/view/address/address_list_view.dart';
import 'package:tanfeth_apps/food/feed_me/presentation/view/map/map_view.dart';


class AddressListRouting extends RoutingConfig {
  AddressListRouting();

  static const String _path = '/AddressList/';



  static RoutingConfig config() {
    switch (customAppFlavor.appNameEnum) {
      case AppNameEnum.taxi24Driver:
        return RoutingConfig(path: _path, widget: const AddressListView());
      case AppNameEnum.feedMe:
        return RoutingConfig(path: _path, widget: const AddressListView());

      default:
        return RoutingConfig(path: _path, widget: const AddressListView());
    }
  }
}

