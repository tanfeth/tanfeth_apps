
import 'package:api_controller/model/auth/AuthenticateResponseModel.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:api_controller/api/api_controller.dart';


final splashProvider =
    FutureProvider.autoDispose<AuthenticateResponseModel?>((ref) async {
  try {
    var response = await  Auth.reToken();
    if (response != null) {
      AuthenticateResponseModel authResponse =
          AuthenticateResponseModel.fromJson(response.objectResponse);

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

