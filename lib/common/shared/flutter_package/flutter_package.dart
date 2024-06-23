

import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:tanfeth_apps/common/network/network/api/api_controller.dart';

class FlutterPackage {
  static late String defaultLogoPath;
  static late String defaultLogoPathDark;
  static late String? defaultFontPath;
  static late Widget Function(BuildContext) drawerWidgetList;

  static Future<void> init({
    required String defaultLogoPath,
    String? defaultLogoPathDark,
    String? defaultFontPath,
    bool isCultureHeader = false,
    bool showConnectionListener = true,
    required String baseUrl,
    required String serverErrorMessage,
    required String connectionErrorMessage,
    Widget Function(BuildContext)? drawerWidgetList,
  }) async {
   FlutterPackage.defaultLogoPath = defaultLogoPath;
   FlutterPackage.defaultLogoPathDark = defaultLogoPathDark ?? defaultLogoPath;
   FlutterPackage.defaultFontPath = defaultFontPath;
   FlutterPackage.drawerWidgetList = drawerWidgetList ?? (_) => Container();
   ApiController.init(
        baseUrl: baseUrl,
        showConnectionListener: showConnectionListener,
        serverErrorMessage: serverErrorMessage,
        connectionErrorMessage: connectionErrorMessage,
        isCultureHeader: isCultureHeader);
    GetStorage.init();
  }
}
