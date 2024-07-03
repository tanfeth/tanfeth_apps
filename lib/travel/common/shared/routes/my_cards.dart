


import 'package:tanfeth_apps/common/shared/routing/routing_config.dart';
import 'package:tanfeth_apps/flavor/flavor_config.dart';
import 'package:tanfeth_apps/flavor/init_binding.dart';
import 'package:tanfeth_apps/travel/taxi24/taxi24_passenger/presentation/view/my_cards/my_cards.dart';

class MyCardsRouting extends RoutingConfig {
  MyCardsRouting();

  static const String _path = '/MyCards/';


  static RoutingConfig config() {
    switch (customAppFlavor.appNameEnum) {
      case AppNameEnum.taxi24Driver:
        return RoutingConfig(path: _path, widget:  MyCards());
      case AppNameEnum.taxi24Passenger:
        return RoutingConfig(path: _path, widget:  MyCards());
      default:
        return RoutingConfig(path: _path, widget:  MyCards());
    }
  }
}



