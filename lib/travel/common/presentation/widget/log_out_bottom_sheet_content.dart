


import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:api_controller/api/api_controller.dart';
import 'package:api_controller/presentation/widget/bottom_sheet/close_bottom_sheet_widget.dart';
import 'package:tanfeth_apps/common/shared/extensions/button_extensions.dart';
import 'package:api_controller/shared/extensions/padding_extension.dart';
import 'package:api_controller/shared/extensions/theme_extensions.dart';
import 'package:tanfeth_apps/common/shared/languages.dart';
import 'package:tanfeth_apps/common/shared/routing/routes/welcome_route.dart';

class LogOutBottomSheetContent extends StatelessWidget {
  const LogOutBottomSheetContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [

          10.ph,
          const Center(child: CloseBottomSheetWidget()),
          10.ph,

          Text(
            LangEnum.areSureWantLogout.tr(),
            style: context.text.titleMedium,
          ),
          const SizedBox(
            height: 32,
          ),


          Center(
            child: Container(
              height: 40,
              width: double.infinity,
              margin:const  EdgeInsets.symmetric(horizontal: 15),
              child: ElevatedButton(
                style: const ButtonStyle().MinErrorElevatedButton(context),
                onPressed: () {
                  Auth.clearToken();
                  Get.offAllNamed(WelcomeRouting.config().path);
                },
                child: Text(
                  LangEnum.logout.tr(),
                  textScaler: TextScaler.noScaling,
                ),
              ),
            ),
          ),

          const SizedBox(
            height: 10,
          ),
          Center(
            child: InkWell(
                onTap: () {
                  Get.back();
                },
                child: Text(
                  LangEnum.cancel.tr(),
                  style: context.text.titleMedium,
                )
            ),
          ),
        ],
      ),
    );
  }
}
