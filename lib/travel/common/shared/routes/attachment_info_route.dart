
import 'package:tanfeth_apps/common/shared/routing/routing_config.dart';
import 'package:tanfeth_apps/flavor/flavor_config.dart';
import 'package:tanfeth_apps/flavor/init_binding.dart';
import 'package:tanfeth_apps/travel/taxi24/taxi24_driver/presentation/view/account_status/account_status.dart';
import 'package:tanfeth_apps/travel/taxi24/taxi24_driver/presentation/view/attachment_info/attachment_info_view.dart';


class AttachmentInfoRouting extends RoutingConfig {
  AttachmentInfoRouting();

  static const String _path = '/AttachmentInfo/';
  static const String attachmentInfoModel = 'attachmentInfoModel';


  static RoutingConfig config() {
    switch (customAppFlavor.appNameEnum) {
      case AppNameEnum.taxi24Driver:
        return RoutingConfig(path: _path, widget: const AttachmentInfoView());
      default:
        return RoutingConfig(path: _path, widget: const AttachmentInfoView());
    }
  }
}

