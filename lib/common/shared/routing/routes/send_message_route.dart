


import 'package:tanfeth_apps/common/shared/routing/routing_config.dart';
import 'package:tanfeth_apps/flavor/flavor_config.dart';
import 'package:tanfeth_apps/flavor/init_binding.dart';
import 'package:tanfeth_apps/travel/taxi24/taxi24_driver/presentation/view/profile/profile_view.dart';
import 'package:tanfeth_apps/travel/taxi24/taxi24_driver/presentation/view/send_message/send_message.dart';

class SendMessageRouting extends RoutingConfig {
  SendMessageRouting();

  static const String _path = '/SendMessage/';


  static RoutingConfig config() {
    switch (customAppFlavor.appNameEnum) {
      case AppNameEnum.taxi24Driver:
        return RoutingConfig(path: _path, widget: const SendMessageView());
      default:
        return RoutingConfig(path: _path, widget: const SendMessageView());
    }
  }
}




