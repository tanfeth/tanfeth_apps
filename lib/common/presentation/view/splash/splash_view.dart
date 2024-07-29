

import 'package:api_controller/model/auth/AuthenticateResponseModel.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/get.dart';
import 'package:tanfeth_apps/common/presentation/view/splash/vm/splash_vm.dart';
import 'package:api_controller/presentation/widget/progress_loading.dart';
import 'package:tanfeth_apps/common/shared/helper_methods.dart';
import 'package:tanfeth_apps/common/shared/images.dart';
import 'package:tanfeth_apps/common/shared/notification/CustomNotification.dart';
import 'package:tanfeth_apps/common/shared/routing/routes/language_route.dart';
import 'package:tanfeth_apps/common/shared/routing/routes/onboard_route.dart';
import 'package:tanfeth_apps/common/shared/routing/routes/welcome_route.dart';
import 'package:api_controller/shared/sizes.dart';
import 'package:tanfeth_apps/common/shared/storage.dart';
import 'package:api_controller/shared/web_width.dart';
import 'package:tanfeth_apps/travel/common/data/model/auth/BodyDeviceTokenModel.dart';
import 'package:tanfeth_apps/travel/common/data/repo/auth/auth_repo.dart';
import 'package:tanfeth_apps/travel/common/shared/routes/driver_data_route.dart';


class SplashView extends ConsumerStatefulWidget {
  const SplashView({
    super.key,
  });

  @override
  ConsumerState createState() => _SplashViewState();
}

class _SplashViewState extends ConsumerState<SplashView> {

  @override
  void initState() {
    super.initState();
  }

  initBuild(){
    // FirebaseAuth.instance.signOut();
    // GoogleSignIn().signOut();
    ref.listen(splashProvider,
            (_, AsyncValue<AuthenticateResponseModel?> auth) async {
              await Future.delayed(const Duration(seconds: 1));
              await CustomNotification.initNotification();
          if((auth.value?.authToken??'').isNotEmpty){
            try {
              String appVersion = await  getAppVersion();
              AppStorage.saveAppVersion(appVersion);

              FirebaseMessaging.instance.getToken().then((value) {
                BodyDeviceTokenModel bodyDeviceTokenModel =
                BodyDeviceTokenModel();
                bodyDeviceTokenModel.deviceToken = value??'';
                bodyDeviceTokenModel.appVersion = appVersion;
                deviceTokenApi(model: bodyDeviceTokenModel);
              });

              WidgetsBinding.instance.addPostFrameCallback((_) {
                initURIHandler();
              });

              if (Get.arguments != null) {
                WidgetsBinding.instance.addPostFrameCallback((_) {
                  Get.toNamed(Get.arguments);
                });
              }


              Get.offAllNamed(DriverDataRouting.config().path);
            } catch (e) {
              Get.offAllNamed(WelcomeRouting.config().path);
            }

          }else {
            if (AppStorage.getIsSavedLocale().isEmpty){
              Get.offAllNamed(LanguageRouting.config().path);
            } else if (!AppStorage.getOnBoardStatus()) {
              Get.offAllNamed(OnBoardingRouting.config().path);
            } else {
              Get.offAllNamed(WelcomeRouting.config().path);
            }
          }

        }, onError: (e, _) {
          Get.offAllNamed(WelcomeRouting.config().path);
        });

  }


  @override
  Widget build(BuildContext context) {
    initBuild();
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 0,
        backgroundColor: Theme.of(context).colorScheme.surface,
      ),
      body: WebWidth(
        child: SafeArea(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
                height: 250, width: 250,
                child: Image.asset(Images.appLogo)),
            const SizedBox(height: MySizes.defaultPadding),
            // Text(LangEnum.appSlogan.tr(),
            //     textAlign: TextAlign.center,
            //     style: Theme.of(context)
            //         .textTheme
            //         .headlineMedium
            //         ?.copyWith(color: Theme.of(context).colorScheme.primary)),
            ProgressLoading.showIndicator(context),
          ],
        )),
      ),
    );
  }

}
