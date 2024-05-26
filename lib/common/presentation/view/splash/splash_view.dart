import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/get.dart';
import 'package:tanfeth_apps/common/data/model/auth/AuthenticateResponseModel.dart';
import 'package:tanfeth_apps/common/data/model/notification/NotificationDeviceModel.dart';
import 'package:tanfeth_apps/common/data/repo/user/user_repo.dart';
import 'package:tanfeth_apps/common/presentation/view/splash/vm/splash_vm.dart';
import 'package:tanfeth_apps/common/presentation/widget/progress_loading.dart';
import 'package:tanfeth_apps/common/shared/helper_methods.dart';
import 'package:tanfeth_apps/common/shared/images.dart';
import 'package:tanfeth_apps/common/shared/languages.dart';
import 'package:tanfeth_apps/common/shared/notification/CustomNotification.dart';
import 'package:tanfeth_apps/common/shared/routing/auth_routing.dart';
import 'package:tanfeth_apps/common/shared/sizes.dart';


class SplashView extends ConsumerStatefulWidget {
  const SplashView({
    Key? key,
  }) : super(key: key);

  @override
  ConsumerState createState() => _SplashViewState();
}

class _SplashViewState extends ConsumerState<SplashView> {

  @override
  void initState() {
    FirebaseMessaging.instance.getToken().then((value) {
      NotificationDeviceModel notificationDeviceModel =
      NotificationDeviceModel();
      notificationDeviceModel.appVersion = "";
      notificationDeviceModel.deviceModel = "";
      notificationDeviceModel.deviceType = "";
      notificationDeviceModel.notificationToken = value;
      addDeviceApi(notificationDeviceModel: notificationDeviceModel);
    });

    WidgetsBinding.instance.addPostFrameCallback((_) {
      initURIHandler();
    });

    if (Get.arguments != null)
      WidgetsBinding.instance.addPostFrameCallback((_) {
        Get.toNamed(Get.arguments);
      });

    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    // FirebaseAuth.instance.signOut();
    // GoogleSignIn().signOut();

    ref.listen(splashProvider,
        (_, AsyncValue<AuthenticateResponseModel?> isAuth) async {
      await CustomNotification.initNotification();
      Get.offAllNamed(LoginRouting.config().path);
    }, onError: (e, _) {});

    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 0,
        backgroundColor: Theme.of(context).colorScheme.background,
      ),
      body: SafeArea(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
              height: 200, width: 200, child: Image.asset(Images.appLogo)),
          SizedBox(height: MySizes.defaultPadding),
          Text(LangEnum.appSlogan.tr(),
              textAlign: TextAlign.center,
              style: Theme.of(context)
                  .textTheme
                  .headlineMedium
                  ?.copyWith(color: Theme.of(context).colorScheme.primary)),
          ProgressLoading.showIndicator(context),
        ],
      )),
    );
  }
}
