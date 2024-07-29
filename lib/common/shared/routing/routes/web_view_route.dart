


import 'package:api_controller/route/routing_config.dart';
import 'package:tanfeth_apps/flavor/flavor_config.dart';
import 'package:tanfeth_apps/flavor/init_binding.dart';
import 'package:tanfeth_apps/travel/common/presentation/widget/web_view_view.dart';

class WebViewRouting extends RoutingConfig {
  WebViewRouting();

  static const String _path = '/WebView/';
  static const String pageUrl = 'pageUrl';
  static const String successEnum = 'successEnum';
  static const String appBarTitle = 'appBarTitle';

  static RoutingConfig config() {
    switch (customAppFlavor.appNameEnum) {
      case AppNameEnum.taxi24Driver:
        return RoutingConfig(path: _path, widget: const WebViewScreen());
        default:
        return RoutingConfig(path: _path, widget: const WebViewScreen());
    }
  }
}

