
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:tanfeth_apps/common/network/network/api/api_controller.dart';
import 'package:tanfeth_apps/common/shared/languages.dart';

void internetConnectionListener() {
  InternetConnectionChecker().onStatusChange.listen((event) async {
    var state = event == InternetConnectionStatus.disconnected;
    if (state != ApiController.isDisconnect) {
      ApiController.isDisconnect = state;
      if ((await InternetConnectionChecker().hasConnection) !=
          ApiController.isDisconnect) {
        if (ApiController.isDisconnect) {
          Get.snackbar(
            LangEnum.hintInternetConnection
                .toString()
                .tr,
            ApiController.isDisconnect
                ? LangEnum.noInternetConnection
                .toString()
                .tr
                : LangEnum.yesInternetConnection
                .toString()
                .tr,
            backgroundColor:
            ApiController.isDisconnect ? Colors.red : Colors.green,
            colorText: ApiController.isDisconnect
                ? Colors.white
                : Colors.white,);
        }
      }

    }
  });
}

Future<bool> hasConnection() async {
  return kIsWeb ? true : await InternetConnectionChecker().hasConnection;
}
