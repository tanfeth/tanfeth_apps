
import 'package:flutter/services.dart';
import 'package:tanfeth_apps/common/shared/custom_methods.dart';



class Lottie {
  static String correct = "";



  static Future<void> initLottie() async {
    correct = await checkLottie("correct.json");
  }


  static Future<String> checkLottie(String path) async {
    var finalPath = "";
    try {
      if (isTaxi24Driver){
        finalPath = "assets/taxi24Driver/lottie/" + path;
      }else if(isTaxi24Passenger){
        finalPath = "assets/taxi24Client/lottie/" + path;
      }
      await rootBundle.loadString(finalPath);
      return finalPath;
    } on FormatException {
      return finalPath;
    } catch (_) {
      return "assets/common/lottie/" + path;

      // if (customAppFlavor.appCategoryEnum.contains(AppCategoryEnum.travel)) {
      //   try {
      //     var pathMedical = "assets/medical/common/lottie/" + path;
      //     await rootBundle.loadString(pathMedical);
      //     return pathMedical;
      //   } on FormatException {
      //     var pathMedical = "assets/medical/common/lottie/" + path;
      //     return pathMedical;
      //   } catch (_) {
      //     return "assets/common/lottie/" + path;
      //   }
      // } else if (customAppFlavor.appCategoryEnum.contains(AppCategoryEnum.Sport)) {
      //   try {
      //     var pathMedical = "assets/sport/common/lottie/" + path;
      //     await rootBundle.loadString(pathMedical);
      //     return pathMedical;
      //   } on FormatException {
      //     var pathMedical = "assets/sport/common/lottie/" + path;
      //     return pathMedical;
      //   } catch (_) {
      //     return "assets/common/lottie/" + path;
      //   }
      // } else {
      //   return "assets/common/lottie/" + path;
      // }
    }
  }
}
