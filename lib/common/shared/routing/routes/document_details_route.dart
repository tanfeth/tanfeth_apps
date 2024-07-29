




import 'package:api_controller/route/routing_config.dart';
import 'package:tanfeth_apps/flavor/flavor_config.dart';
import 'package:tanfeth_apps/flavor/init_binding.dart';
import 'package:tanfeth_apps/travel/taxi24/taxi24_driver/presentation/view/document_details/document_details_view.dart';

class DocumentDetailsRouting extends RoutingConfig {
  DocumentDetailsRouting();

  static const String _path = '/DocumentDetails/';
  static const String pageTitle = 'pageTitle';
  static const String image = 'image';


  static RoutingConfig config() {
    switch (customAppFlavor.appNameEnum) {
      case AppNameEnum.taxi24Driver:
        return RoutingConfig(path: _path, widget: const DocumentDetailsView());
      default:
        return RoutingConfig(path: _path, widget: const DocumentDetailsView());
    }
  }
}