
import 'package:api_controller/model/auth/AuthenticateResponseModel.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tanfeth_apps/flavor/init_binding.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart'
as storage_secure;

final splashProvider =
    FutureProvider.autoDispose<AuthenticateResponseModel?>((ref) async {
  try {
    String? token;
    const storage =  storage_secure.FlutterSecureStorage();
    token = await storage.read(key: customAppFlavor.commonEnum.authToken);

   // var response = await  Auth.reToken();
    if (token != null || (token??'').isNotEmpty) {
      // AuthenticateResponseModel authResponse =
      //     AuthenticateResponseModel.fromJson(response.objectResponse);
      AuthenticateResponseModel authResponse = AuthenticateResponseModel();
      authResponse.authToken = token;

      return authResponse;

    } else{
      return null;
    }

  } catch (e) {
    return null;
  }
});


// void handleNitroSplash() async {
//   await Future.delayed(const Duration(seconds: 3));
//   if (AppStorage.getIsLogin()) {
//     try {
//       //await findNitroProfileVM.getProfile();
//       Get.offAllNamed(LayoutRouting.config().path);
//     } catch (e) {
//       nitroLogOut();
//     }
//   } else {
//     if (AppStorage.getIsSavedLocale().isEmpty) {
//      // Get.offAllNamed(LanguageRouting.config().path);
//     } else if (!AppStorage.getOnBoardStatus()) {
//       Get.offAllNamed(OnBoardingRouting.config().path);
//     } else {
//       Get.offAllNamed(LoginRegisterRouting.config().path);
//     }
//   }
// }

