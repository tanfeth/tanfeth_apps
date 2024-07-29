import 'dart:io';
import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:share_plus/share_plus.dart';
import 'package:tanfeth_apps/flavor/init_binding.dart';
import 'package:store_redirect/store_redirect.dart';
import 'package:showcaseview/showcaseview.dart';



void shareApp() async {
  final box = Get.context?.findRenderObject() as RenderBox?;
  if (Platform.isAndroid) {
    await Share.share(customAppFlavor.commonEnum.appStoreEnums.androidUrl);
  } else if (Platform.isIOS) {
    await Share.share(
      customAppFlavor.commonEnum.appStoreEnums.iosUrl,
      sharePositionOrigin: box!.localToGlobal(Offset.zero) & box.size,
    );
  }
}

void rateAppOnStore() {
  StoreRedirect.redirect(
    androidAppId: customAppFlavor.commonEnum.appStoreEnums.androidID,
    iOSAppId: customAppFlavor.commonEnum.appStoreEnums.iosID,
  );
}




String countryFlag({required String countryCode}) {
  String flag = countryCode.toUpperCase().replaceAllMapped(RegExp(r'[A-Z]'),
          (match) => String.fromCharCode(match.group(0)!.codeUnitAt(0) + 127397));
  return flag;
}


Country getCountry() {
  return Country.parse(customAppFlavor.defaultCountryCode);
}

