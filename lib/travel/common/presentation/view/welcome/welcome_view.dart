import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:oktoast/oktoast.dart';
import 'package:tanfeth_apps/common/shared/extensions/button_extensions.dart';
import 'package:tanfeth_apps/common/shared/extensions/padding_extension.dart';
import 'package:tanfeth_apps/common/shared/extensions/theme_extensions.dart';
import 'package:tanfeth_apps/common/shared/images.dart';
import 'package:tanfeth_apps/common/shared/languages.dart';
import 'package:tanfeth_apps/common/shared/routing/routes/auth_routing/login_routing.dart';
import 'package:tanfeth_apps/common/shared/web_width.dart';

class WelcomeView extends ConsumerStatefulWidget {
  const WelcomeView({Key? key}) : super(key: key);

  @override
  ConsumerState<WelcomeView> createState() => _WelcomeViewState();
}

class _WelcomeViewState extends ConsumerState<WelcomeView>{
   DateTime backPressDateTime = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvoked: (didPop) async {
        final timeGap = DateTime.now().difference(backPressDateTime);
        final cantExit = timeGap >= const Duration(seconds: 2);
        backPressDateTime = DateTime.now();
        if (cantExit) {
          showToast(LangEnum.pressAgainToExit.tr(),
              position: ToastPosition.bottom);
        } else {
          SystemNavigator.pop();
        }
      },
      child: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle(
          statusBarColor: context.color.primary.withOpacity(0.4),
        ),
        child: Scaffold(
          resizeToAvoidBottomInset: true,
          extendBody: true,
          body: WebWidth(
            child: Container(
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.bottomLeft,
                      end: Alignment.topRight,
                      colors: [
                        context.color.primary,
                        context.color.primary.withOpacity(0.4),
                      ])),
              child: Column(
                children: [
                  Expanded(
                    child: Container(
                      alignment: Alignment.center,
                      child: SingleChildScrollView(
                        physics: const BouncingScrollPhysics(),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Center(
                              child: SvgPicture.asset(
                                Images.appLogoSVG,
                                height: 170,
                                width: 170,
                              ),
                            ),
                            50.ph,
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                SvgPicture.asset(
                                  Images.welcomeGroup10SVG,
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 100),
                                  child: SvgPicture.asset(
                                    Images.welcomeGroup14SVG,
                                  ),
                                ),
                              ],
                            ),
                            20.ph,
                          ],
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          LangEnum.welcomeTitle.tr(),
                          style: context.text.titleMedium,
                        ),
                        5.ph,
                        Text(
                          LangEnum.welcomeDes.tr(),
                          style: context.text.bodySmall,
                        ),
                        50.ph,
                        ElevatedButton(
                          style:
                          const ButtonStyle().OnBackOutlinedButton(context),
                          onPressed: () {
                            Get.toNamed(LoginRouting.config().path);
                          },
                          child: Text(
                            LangEnum.start.tr(),
                            style: TextStyle(color: context.color.onSurface),
                          ),
                        ),
                        20.ph,
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

}


