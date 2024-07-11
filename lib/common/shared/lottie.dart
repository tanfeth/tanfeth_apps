
import 'package:flutter/services.dart';
import 'package:tanfeth_apps/common/shared/custom_methods.dart';



class LottieFiles {
  static String correct = "";
  static String promoCode = "";
  static String taxiLoading = "";

  static Future<void> initLottie() async {
    correct = await checkLottie("correct.json");
    promoCode = await checkLottie("promo_code.json");
    taxiLoading = await checkLottie("taxi_loading.json");
  }


  static Future<String> checkLottie(String path) async {
    var finalPath = "";
    try {
      if (isTaxi24Driver){
        finalPath = "assets/taxi24Driver/lottie/$path";
      }else if(isTaxi24Passenger){
        finalPath = "assets/taxi24Client/lottie/$path";
      }
      await rootBundle.loadString(finalPath);
      return finalPath;
    } on FormatException {
      return finalPath;
    } catch (_) {
      return "assets/common/lottie/$path";

    }
  }
}
