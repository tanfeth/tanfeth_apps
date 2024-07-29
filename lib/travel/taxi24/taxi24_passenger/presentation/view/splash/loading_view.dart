
import 'package:api_controller/presentation/widget/progress_loading.dart';
import 'package:api_controller/shared/flutter_package/flutter_package.dart';
import 'package:api_controller/shared/globals.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tanfeth_apps/common/shared/images.dart';
import 'package:tanfeth_apps/common/shared/languages.dart';
import 'package:tanfeth_apps/common/shared/lottie.dart';
import 'package:tanfeth_apps/common/shared/routing/routes/splash_routing.dart';
import 'package:tanfeth_apps/flavor/init_binding.dart';

class LoadingView extends StatelessWidget {
  const LoadingView({super.key});

  @override
  Widget build(BuildContext context) {
    final future = [
      Globals.init(),
      //CustomSignalR.init(),
      Images.initImages(),
      LottieFiles.initLottie(),
    ];
    return Scaffold(
      body: FutureBuilder(
          future: Future.wait(future),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done&&Get.currentRoute=="/init") {
              WidgetsBinding.instance.addPostFrameCallback((_) async {
                 await FlutterPackage.init(
                    defaultLogoPath: Images.appLogo,
                    defaultLogoPathDark: Images.appLogo,
                     showConnectionListener:false,
                    baseUrl: customAppFlavor.baseUrl,
                    serverErrorMessage: LangEnum.somethingWrong.tr(),
                    isCultureHeader: true,
                    connectionErrorMessage: LangEnum.connectionError.tr());
                Get.toNamed(SplashRouting.config().path);
              });
            }
            return Center(child:
            ProgressLoading.showIndicator(context));
          }),
    );
  }

}
