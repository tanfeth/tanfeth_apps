




import 'package:api_controller/route/routing_config.dart';
import 'package:tanfeth_apps/flavor/flavor_config.dart';
import 'package:tanfeth_apps/flavor/init_binding.dart';
import 'package:tanfeth_apps/food/feed_me/presentation/view/offers/offers_view.dart';
import 'package:tanfeth_apps/travel/taxi24/taxi24_driver/presentation/view/document/document_view.dart';

class OffersRouting extends RoutingConfig {
  OffersRouting();

  static const String _path = '/Offers/';


  static RoutingConfig config() {
    switch (customAppFlavor.appNameEnum) {
      case AppNameEnum.taxi24Driver:
        return RoutingConfig(path: _path, widget: const OffersView());
      default:
        return RoutingConfig(path: _path, widget: const OffersView());
    }
  }
}