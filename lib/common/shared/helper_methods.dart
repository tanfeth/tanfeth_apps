import 'dart:io';
import 'package:country_picker/country_picker.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:lottie/lottie.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:share_plus/share_plus.dart';
import 'package:tanfeth_apps/common/shared/extensions/theme_extensions.dart';
import 'package:tanfeth_apps/common/shared/lottie.dart';
import 'package:tanfeth_apps/common/shared/sizes.dart';
import 'package:tanfeth_apps/flavor/init_binding.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:http/http.dart' as http;
import 'package:store_redirect/store_redirect.dart';
import 'dart:typed_data';
import 'package:uni_links/uni_links.dart';
import 'package:showcaseview/showcaseview.dart';



void openKeyboard({required BuildContext context,
  required FocusNode focusNode}){
  FocusScope.of(context).requestFocus(focusNode);
}


void closeKeyBoard() {
  FocusManager.instance.primaryFocus?.unfocus();
}

void closeBottomSheet() {
  if (Get.isBottomSheetOpen == true) Get.back();
}

Future<http.MultipartFile> convertImage({required String imageKey, required String imagePath}) async {
  return await http.MultipartFile.fromPath(imageKey, imagePath);
}

void showLoading({Widget? child}) {
  Get.dialog(
      PopScope(
        canPop: false,
        child: Center(child:child??
            Container(
                height: 120,
                width: 120,
                decoration: BoxDecoration(
                    color: Get.context?.color.surface,
                    borderRadius: const BorderRadius.all(Radius.circular(15))
                ),
                child: const Center(child:  CircularProgressIndicator()))
          ,)),
    barrierColor: Colors.black.withOpacity(.35),
    barrierDismissible: false,
  );
}

void hideLoading() {
  if (Get.isDialogOpen!) Get.back();
}

void openMapNavigation({required double lat, required double lng}) async {
  Uri appleUrl = Uri.parse('https://maps.apple.com/?saddr=&daddr=$lat,$lng&directionsmode=driving');
  Uri uri = Uri.parse("google.navigation:q=$lat,$lng&mode=d");
  if (Platform.isIOS) {
    await urlLauncher(appleUrl);
  } else {
    await urlLauncher(uri);
  }
}

Future<void> urlLauncher(Uri uri) async {
  if (!await launchUrl(uri, mode: LaunchMode.externalApplication)) {
    throw Exception('Could not launch $uri');
  }
}

Future<http.MultipartFile> fileToMultiPart({required String key, required String path}) async {
  return await http.MultipartFile.fromPath(key, path);
}

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

Future<void> makePhoneCall({required String phoneNumber}) async {
  final Uri launchUri = Uri(
    scheme: 'tel',
    path: phoneNumber,
  );
  await launchUrl(launchUri);
}


Widget imageView(PlatformFile? platformFile) {
  return ClipRRect(
      borderRadius: const  BorderRadius.all(Radius.circular(MySizes.defaultPadding)),
      child: Image.memory(
        Uint8List.fromList(platformFile?.bytes ?? []),
        // File(filePath),
        width: double.infinity,
        fit: BoxFit.cover,
      ));
}


Future<void> initURIHandler() async {
  try {
    final initialURI = await getInitialUri();
    if (initialURI != null) {
      var fullPath = initialURI.path;
      initialURI.queryParameters.forEach((key, value) {
        fullPath += '?$key=$value&';
      });
      Get.toNamed(fullPath);
    }
  } on PlatformException {
    debugPrint("Failed to receive initial uri");
  } on FormatException {
    debugPrint('Malformed Initial URI received');
  }
}



Future<bool?> checkCameraPermission() async {
  if (Platform.isAndroid) {
    Map<Permission, PermissionStatus> statues =
    await [Permission.camera, Permission.photos].request();
    PermissionStatus? statusCamera = statues[Permission.camera];
    PermissionStatus? statusPhotos = statues[Permission.photos];
    bool isGranted = statusCamera == PermissionStatus.granted || statusPhotos == PermissionStatus.granted;
    if (isGranted) {
      return true;
    } else {
      openAppSettings();
    }
  } else {
    Map<Permission, PermissionStatus> statues = await [
      Permission.camera,
      Permission.storage,
      Permission.photos
    ].request();
    PermissionStatus? statusCamera = statues[Permission.camera];
    PermissionStatus? statusStorage = statues[Permission.storage];
    PermissionStatus? statusPhotos = statues[Permission.photos];
    bool isGranted = statusCamera == PermissionStatus.granted && statusStorage == PermissionStatus.granted && statusPhotos == PermissionStatus.granted;
    if (isGranted) {
      return true;
    } else {
      openAppSettings();
    }
  }
  return null;
}

Future<bool?> checkContactsPermission() async {
  Map<Permission, PermissionStatus> statues =
  await [Permission.contacts].request();
  PermissionStatus? statusContacts = statues[Permission.contacts];
  bool isGranted = statusContacts == PermissionStatus.granted;
  if (isGranted) {
    return true;
  } else {
    openAppSettings();
  }
  return null;
}


List<DateTime> returnMonthsOfYear() {
  List<DateTime> list = [];
  final today = DateTime.now();
  for (int month = 1; month <= 12; month++) {
    list.add(DateTime(today.year, month, 1));
  }
  /*final firstDate = DateTime(today.year, 1,);
  final lastDate = DateTime(today.year, 12,);
  for (int i = 0; i <= lastDate.difference(firstDate).inDays ~/ 30; i++) {
    list.add(firstDate.add(Duration(days: (30 * i) + 5)));
  }*/
  return list;
}





String countryFlag({required String countryCode}) {
  String flag = countryCode.toUpperCase().replaceAllMapped(RegExp(r'[A-Z]'),
          (match) => String.fromCharCode(match.group(0)!.codeUnitAt(0) + 127397));
  return flag;
}


Country getCountry() {
  Locale myLocale = Localizations.localeOf(Get.context!);
  print('myLocale => ${myLocale.countryCode}');
  return Country.parse(customAppFlavor.defaultCountryCode);
}



void showCaseEvent({required BuildContext context,
required List<GlobalKey<State<StatefulWidget>>> caseList }){
  WidgetsBinding.instance.addPostFrameCallback((_) =>
      ShowCaseWidget.of(context).startShowCase(caseList)
  );

}

String formatTimestamp(String timestamp) {
  DateTime dateTime = DateTime.parse(timestamp);
  String formattedDate = DateFormat.MMMd().format(dateTime);
  String formattedTime = DateFormat.jm().format(dateTime);
  String formattedDateTime = '$formattedDate - $formattedTime';
  return formattedDateTime;
}





