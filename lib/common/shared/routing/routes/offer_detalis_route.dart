




import 'package:api_controller/route/routing_config.dart';
import 'package:tanfeth_apps/flavor/flavor_config.dart';
import 'package:tanfeth_apps/flavor/init_binding.dart';
import 'package:tanfeth_apps/food/feed_me/presentation/view/offer_details/offer_details_view.dart';


class OfferDetailsRouting extends RoutingConfig {
  OfferDetailsRouting();

  static const String _path = '/OfferDetails/';


  static RoutingConfig config() {
    switch (customAppFlavor.appNameEnum) {
      case AppNameEnum.taxi24Driver:
        return RoutingConfig(path: _path, widget: const OfferDetailsView());
      case AppNameEnum.feedMe:
        return RoutingConfig(path: _path, widget: const OfferDetailsView());
      default:
        return RoutingConfig(path: _path, widget: const OfferDetailsView());
    }
  }
}