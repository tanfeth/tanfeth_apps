
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tanfeth_apps/common/data/model/auth/AuthenticateResponseModel.dart';
import 'package:tanfeth_apps/common/network/network/api/api_controller.dart';


final splashProvider =
    FutureProvider.autoDispose<AuthenticateResponseModel?>((ref) async {
  try {
    String? token;
    SharedPreferences prefs = await SharedPreferences.getInstance();
    token = prefs.getString("RefreshToken");

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

