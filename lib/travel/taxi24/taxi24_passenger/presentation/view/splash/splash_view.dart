
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/get.dart';
import 'package:tanfeth_apps/common/data/model/notification/NotificationDeviceModel.dart';
import 'package:tanfeth_apps/common/presentation/widget/progress_loading.dart';
import 'package:tanfeth_apps/common/shared/extensions/theme_extensions.dart';
import 'package:tanfeth_apps/common/shared/helper_methods.dart';
import 'package:tanfeth_apps/common/shared/images.dart';
import 'package:tanfeth_apps/common/shared/notification/CustomNotification.dart';
import 'package:tanfeth_apps/common/shared/routing/routes/auth_routing/login_routing.dart';
import 'package:tanfeth_apps/common/shared/routing/routes/language_route.dart';
import 'package:tanfeth_apps/common/shared/routing/routes/onboard_route.dart';
import 'package:tanfeth_apps/common/shared/routing/routes/welcome_route.dart';
import 'package:tanfeth_apps/common/shared/sizes.dart';
import 'package:tanfeth_apps/common/shared/storage.dart';
import 'package:tanfeth_apps/common/shared/web_width.dart';


class TaxiPassengerSplashView extends ConsumerStatefulWidget {
  const TaxiPassengerSplashView({
    Key? key,
  }) : super(key: key);

  @override
  ConsumerState createState() => _SplashViewState();
}

class _SplashViewState extends ConsumerState<TaxiPassengerSplashView> {

  @override
  void initState() {
    setUpInitState();
    super.initState();
  }

  initBuild(){
    // FirebaseAuth.instance.signOut();
    // GoogleSignIn().signOut();
    // ref.listen(splashProvider,
    //         (_, AsyncValue<AuthenticateResponseModel?> isAuth) async {
    //       await CustomNotification.initNotification();
    //       Get.offAllNamed(LoginRouting.config().path);
    //     }, onError: (e, _) {});

  }


  @override
  Widget build(BuildContext context) {
    initBuild();
    return AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle(
        statusBarColor:  context.color.primary.withOpacity(0.4),
    ),
      child: Scaffold(
        backgroundColor: context.color.primary,
        appBar: AppBar(
          toolbarHeight: 0,
          backgroundColor: Theme.of(context).colorScheme.surface,
        ),
        body: WebWidth(
          child: SafeArea(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                  height: 250, width: 250,
                  child: Image.asset(Images.appLogo)),
              SizedBox(height: MySizes.defaultPadding),
              ProgressLoading.showIndicator(context,
              color:  context.color.onPrimary),
            ],
          )),
        ),
      ),
    );
  }




  void setUpInitState()async {
    await Future.delayed(const Duration(seconds: 1));
    if (AppStorage.getIsLogin()) {
      try {
        FirebaseMessaging.instance.getToken().then((value) {
          NotificationDeviceModel notificationDeviceModel =
          NotificationDeviceModel();
          notificationDeviceModel.appVersion = "";
          notificationDeviceModel.deviceModel = "";
          notificationDeviceModel.deviceType = "";
          notificationDeviceModel.notificationToken = value;
          //addDeviceApi(notificationDeviceModel: notificationDeviceModel);
        });

        WidgetsBinding.instance.addPostFrameCallback((_) {
          initURIHandler();
        });

        if (Get.arguments != null)
          WidgetsBinding.instance.addPostFrameCallback((_) {
            Get.toNamed(Get.arguments);
          });

        await CustomNotification.initNotification();
        Get.offAllNamed(LoginRouting.config().path);
      } catch (e) {
        Get.offAllNamed(LoginRouting.config().path);
      }
    } else {
      if (AppStorage.getIsSavedLocale().isEmpty){
        Get.offAllNamed(LanguageRouting.config().path);
      } else if (!AppStorage.getOnBoardStatus()) {
        Get.offAllNamed(OnBoardingRouting.config().path);
      } else {
        Get.offAllNamed(WelcomeRouting.config().path);
      }



    }}
}
