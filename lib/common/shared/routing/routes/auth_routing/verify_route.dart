
import 'package:flutter/material.dart';
import 'package:tanfeth_apps/common/shared/routing/routing_config.dart';
import 'package:tanfeth_apps/flavor/flavor_config.dart';
import 'package:tanfeth_apps/flavor/init_binding.dart';
import 'package:tanfeth_apps/travel/taxi24/taxi24_driver/presentation/view/auth/login/login_view.dart';
import 'package:tanfeth_apps/travel/taxi24/taxi24_driver/presentation/view/auth/verify/verify_view.dart';



class VerifyRouting  {
  VerifyRouting();

  static const String _path = '/Verify/';

  static RoutingConfig config() {
    switch (customAppFlavor.appNameEnum) {
      case AppNameEnum.taxi24Driver:
        return RoutingConfig(path: _path, widget: const VerifyView());
      default:
        return RoutingConfig(path: _path, widget: const VerifyView(),);
    }
  }
}