

import 'package:tanfeth_apps/common/shared/routing/routing_config.dart';
import 'package:tanfeth_apps/flavor/flavor_config.dart';
import 'package:tanfeth_apps/flavor/init_binding.dart';
import 'package:tanfeth_apps/travel/taxi24/taxi24_driver/presentation/view/personal_info/personal_info_view.dart';

class PersonalInfoRouting extends RoutingConfig {
  PersonalInfoRouting();

  static const String _path = '/PersonalInfo/';


  static RoutingConfig config() {
    switch (customAppFlavor.appNameEnum) {
      case AppNameEnum.taxi24Driver:
        return RoutingConfig(path: _path, widget: const PersonalInfoView());
      default:
        return RoutingConfig(path: _path, widget: const PersonalInfoView());
    }
  }
}


