import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:tanfeth_apps/common/shared/extensions/button_extensions.dart';
import 'package:tanfeth_apps/common/shared/extensions/padding_extension.dart';
import 'package:tanfeth_apps/common/shared/extensions/theme_extensions.dart';
import 'package:tanfeth_apps/common/shared/images.dart';
import 'package:tanfeth_apps/common/shared/languages.dart';
import 'package:api_controller/mode/app_mode.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tanfeth_apps/common/shared/routing/routes/splash_routing.dart';
import 'package:api_controller/shared/web_width.dart';
import 'package:api_controller/vm/langauge/langauge_vm.dart';


class Taxi24PassengerLanguageView extends ConsumerWidget {
  const Taxi24PassengerLanguageView();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle(
        statusBarColor:  context.color.primary.withOpacity(0.4),
    ),
      child: Scaffold(
        backgroundColor: context.color.primary,
        body: WebWidth(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: 250,
                height: 250,
                child: Image.asset(Images.appLogo),
              ),
              50.ph,
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: ElevatedButton(
                      style: const ButtonStyle().GreyElevatedButton(context),
                      onPressed: () {
                        AppMode.changeLanguageMode(localeCode: "en",ref: ref);
                        ref
                            .read(languageProvider.notifier)
                            .update(locale: "en");
                        Get.offAllNamed(
                            SplashRouting.config().path);
                        },
                      child: Text(
                        LangEnum.english.tr(),
                        textScaler: TextScaler.noScaling,
                      ),
                    ),
                  ),
                  15.pw,
                  Expanded(
                    child: ElevatedButton(
                      style: const ButtonStyle().SurfaceElevatedButton(context),
                      onPressed: () {
                        AppMode.changeLanguageMode(localeCode: "ar",ref: ref);
                        ref
                            .read(languageProvider.notifier)
                            .update(locale: "ar");
                        Get.offAllNamed(
                            SplashRouting.config().path);
                      },
                      child: Text(LangEnum.arabic.tr()),
                    ),
                  ),
                ],
              ).hPadding(30),
            ],
          ),
        ),
      ),
    );
  }
}
