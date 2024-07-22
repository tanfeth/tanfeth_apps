
import 'package:tanfeth_apps/common/shared/routing/routing_config.dart';
import 'package:tanfeth_apps/flavor/flavor_config.dart';
import 'package:tanfeth_apps/flavor/init_binding.dart';
import 'package:tanfeth_apps/travel/taxi24/taxi24_driver/presentation/view/confirm_photo/confirm_photo_view.dart';

class ConfirmPhotoRouting extends RoutingConfig {
  ConfirmPhotoRouting();

  static const String _path = '/ConfirmPhoto/';


  static RoutingConfig config() {
    switch (customAppFlavor.appNameEnum) {
      case AppNameEnum.taxi24Driver:
        return RoutingConfig(path: _path, widget: const ConfirmPhotoView());
      default:
        return RoutingConfig(path: _path, widget: const ConfirmPhotoView());
    }
  }
}

