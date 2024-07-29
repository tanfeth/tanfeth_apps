

import 'package:api_controller/route/routing_config.dart';
import 'package:tanfeth_apps/flavor/flavor_config.dart';
import 'package:tanfeth_apps/flavor/init_binding.dart';
import 'package:tanfeth_apps/travel/taxi24/taxi24_driver/presentation/view/personal_info/personal_info_view.dart';
import 'package:tanfeth_apps/travel/taxi24/taxi24_passenger/presentation/view/edit_profile/passenger_edit_profile_view.dart';

class PersonalInfoRouting extends RoutingConfig {
  PersonalInfoRouting();

  static const String _path = '/PersonalInfo/';


  static RoutingConfig config() {
    switch (customAppFlavor.appNameEnum) {
      case AppNameEnum.taxi24Driver:
        return RoutingConfig(path: _path, widget: const PersonalInfoView());
        case AppNameEnum.taxi24Passenger:
        return RoutingConfig(path: _path, widget: const PassengerEditProfileView());
      default:
        return RoutingConfig(path: _path, widget: const PersonalInfoView());
    }
  }
}



