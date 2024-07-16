


import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:tanfeth_apps/common/presentation/widget/bottom_sheet/close_bottom_sheet_widget.dart';
import 'package:tanfeth_apps/common/presentation/widget/bottom_sheet/show_bottom_sheet.dart';
import 'package:tanfeth_apps/common/shared/extensions/padding_extension.dart';
import 'package:tanfeth_apps/common/shared/extensions/theme_extensions.dart';
import 'package:tanfeth_apps/common/shared/images.dart';
import 'package:tanfeth_apps/common/shared/languages.dart';
import 'package:tanfeth_apps/common/shared/routing/routes/welcome_route.dart';
import 'package:tanfeth_apps/travel/taxi24/taxi24_driver/presentation/view/driver_data/widget/help_driver_item_widget.dart';
import 'package:tanfeth_apps/travel/taxi24/taxi24_driver/presentation/widget/log_out_widget.dart';

class HelpWidget extends StatelessWidget {
  const HelpWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return  GestureDetector(
      onTap: () {

        showBottomSheetFunction(
          content: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  10.ph,
                  const Center(child: CloseBottomSheetWidget()),
                  10.ph,
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      HelpDriverItemWidget(
                          title: LangEnum.howStartDriver.tr(),
                          function: () {}),
                      HelpDriverItemWidget(
                          title: LangEnum.vehicleRequirements.tr(),
                          function: () {}),
                      LogOutWidget(
                          title:LangEnum.logout.tr(),
                          function: () {
                            Get.offAllNamed(WelcomeRouting.config().path);
                          }),
                      const SizedBox(
                        height: 40,
                      ),
                    ],
                  ),

                  Center(
                    child: GestureDetector(
                      onTap: () {
                        Get.back();
                      },
                      child: Center(
                        child: Text(
                          LangEnum.close.tr(),
                          style: context.text.titleLarge,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                ]),
          ),
        );
      },
      child: Padding(
        padding:  const EdgeInsets.symmetric(horizontal: 24,),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            
            SvgPicture.asset(
              Images.questionMarkSVG,
              width: 17,
              height: 17,
              colorFilter: ColorFilter.mode(
                  context.color.onSurface,
                  BlendMode.srcIn),
            ),
            Padding(
              padding:  const EdgeInsets.symmetric(horizontal: 8,),
              child:Text(
                LangEnum.help.tr(),
                style: context.text.titleMedium,
              )
            ),

             RotatedBox(
                quarterTurns: 1,
                child: SvgPicture.asset(
                  Images.arrowSVG,
                  colorFilter: ColorFilter.mode(
                      context.color.onSurface,
                      BlendMode.srcIn),
                )),
          ],
        ),
      ),
    );
  }
}
