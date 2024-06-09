


import 'package:tanfeth_apps/common/shared/routing/routing_config.dart';
import 'package:tanfeth_apps/flavor/flavor_config.dart';
import 'package:tanfeth_apps/flavor/init_binding.dart';
import 'package:tanfeth_apps/travel/taxi24/taxi24_driver/presentation/view/car_istimara_confirm_photo/car_istimara_confirm_photo_view.dart';

class CarIstimaraConfirmPhotoRouting extends RoutingConfig {
  CarIstimaraConfirmPhotoRouting();

  static const String _path = '/CarIstimaraConfirmPhoto/';
  static const String isDisable = '/isDisable/';
  static const String file = 'file';
  static const String pageType = 'pageType';
  static const String image = 'image';


  static RoutingConfig config() {
    switch (customAppFlavor.appNameEnum) {
      case AppNameEnum.taxi24Driver:
        return RoutingConfig(path: _path, widget: const CarIstimaraConfirmPhotoView());
      default:
        return RoutingConfig(path: _path, widget: const CarIstimaraConfirmPhotoView());
    }
  }
}





