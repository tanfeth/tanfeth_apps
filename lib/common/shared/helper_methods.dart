import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:share_plus/share_plus.dart';
import 'package:tanfeth_apps/common/shared/sizes.dart';
import 'package:tanfeth_apps/flavor/init_binding.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:http/http.dart' as http;
import 'package:store_redirect/store_redirect.dart';
import 'dart:typed_data';
import 'package:uni_links/uni_links.dart';


void closeKeyBoard() {
  FocusManager.instance.primaryFocus?.unfocus();
}

void closeBottomSheet() {
  if (Get.isBottomSheetOpen == true) Get.back();
}

Future<http.MultipartFile> convertImage({required String imageKey, required String imagePath}) async {
  return await http.MultipartFile.fromPath(imageKey, imagePath);
}

void showLoading() {
  Get.dialog(
    const Center(child: CircularProgressIndicator()),
    barrierColor: Colors.white.withOpacity(.35),
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
        fullPath += '?${key}=${value}&';
      });
      Get.toNamed(fullPath);
    }
  } on PlatformException {
    debugPrint("Failed to receive initial uri");
  } on FormatException catch (err) {
    debugPrint('Malformed Initial URI received');
  }
}
