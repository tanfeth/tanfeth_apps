

import 'package:tanfeth_apps/common/presentation/view/language/language_view.dart';
import 'package:tanfeth_apps/common/shared/routing/routing_config.dart';
import 'package:tanfeth_apps/flavor/flavor_config.dart';
import 'package:tanfeth_apps/flavor/init_binding.dart';


class LanguageRouting  {
  LanguageRouting();

  static const String _path = '/Language/';

  static ScreenConfig config() {
    switch (customAppFlavor.appNameEnum) {
      case AppNameEnum.taxi24Driver:
        return ScreenConfig(path: _path, widget: const LanguageView());
      default:
        return ScreenConfig(path: _path, widget: const LanguageView());
    }
  }
}