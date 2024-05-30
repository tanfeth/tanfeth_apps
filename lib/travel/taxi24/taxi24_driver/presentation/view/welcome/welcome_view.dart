
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:tanfeth_apps/common/shared/extensions/padding_extension.dart';
import 'package:tanfeth_apps/common/shared/extensions/theme_extensions.dart';
import 'package:tanfeth_apps/common/shared/images.dart';
import 'package:tanfeth_apps/common/shared/languages.dart';
import 'package:tanfeth_apps/common/shared/routing/routes/auth_routing/login_routing.dart';
import 'package:tanfeth_apps/common/shared/sizes.dart';
import 'package:tanfeth_apps/common/shared/web_width.dart';

class WelcomeView extends ConsumerWidget{
   const WelcomeView();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: WebWidth(
        child: SafeArea(
          child: Container(
            decoration:  BoxDecoration(
                gradient: LinearGradient(colors: [
                    context.color.primary,
                  context.color.primary.withOpacity(0.2),
                ])),
            child: Column(
              children: [

                Center(
                  child: SvgPicture.asset(
                    Images.appLogoSVG,
                    height: MySizes.defaultPadding * 5,
                    width: MySizes.defaultPadding * 5,
                  ),
                ),

                20.ph,

                Center(
                  child: SvgPicture.asset(
                    Images.welcomeGroup14SVG,
                    height: MySizes.defaultPadding * 5,
                    width: MySizes.defaultPadding * 5,
                  ),
                ),

                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        LangEnum.welcomeTitle.tr(),
                        style:context.text.bodyMedium,
                      ),

                      20.ph,
                      Text(
                        LangEnum.welcomeDes.tr(),
                        style:context.text.bodySmall,
                      ),

                      20.ph,

                      ElevatedButton(
                        onPressed: () {
                          Get.offAllNamed(LoginRouting.config().path);
                        },
                        child: Text(LangEnum.start.tr()),
                      ),

                    ],
                  ),
                ),


              ],
            ),
          ),
        ),
      ),
    );
  }

}