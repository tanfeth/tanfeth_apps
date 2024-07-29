


import 'package:api_controller/route/routing_config.dart';
import 'package:tanfeth_apps/flavor/flavor_config.dart';
import 'package:tanfeth_apps/flavor/init_binding.dart';
import 'package:tanfeth_apps/travel/taxi24/taxi24_passenger/presentation/view/favourite_place/passenger_favourite_place_view.dart';

class FavoritePlaceRouting extends RoutingConfig {
  FavoritePlaceRouting();

  static const String _path = '/FavoritePlace/';


  static RoutingConfig config() {
    switch (customAppFlavor.appNameEnum) {
      case AppNameEnum.taxi24Driver:
        return RoutingConfig(path: _path, widget: const FavouritePlace());
      case AppNameEnum.taxi24Passenger:
        return RoutingConfig(path: _path, widget: const FavouritePlace());
      default:
        return RoutingConfig(path: _path, widget: const FavouritePlace());
    }
  }
}



