



import 'package:tanfeth_apps/common/shared/routing/routing_config.dart';
import 'package:tanfeth_apps/flavor/flavor_config.dart';
import 'package:tanfeth_apps/flavor/init_binding.dart';
import 'package:tanfeth_apps/travel/common/presentation/view/notification/notification_view.dart';


class NotificationsRouting extends RoutingConfig {
  NotificationsRouting();

  static const String _path = '/NotificationsView/';

  static RoutingConfig config() {
    switch (customAppFlavor.appNameEnum) {
      case AppNameEnum.taxi24Driver:
        return RoutingConfig(path: _path, widget: const NotificationsView());
      default:
        return RoutingConfig(path: _path, widget: const NotificationsView());
    }
  }
}




