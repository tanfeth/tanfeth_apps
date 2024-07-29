import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/get.dart';
import 'package:api_controller/presentation/widget/bottom_sheet/close_bottom_sheet_widget.dart';
import 'package:tanfeth_apps/common/shared/extensions/button_extensions.dart';
import 'package:tanfeth_apps/common/shared/extensions/padding_extension.dart';
import 'package:tanfeth_apps/common/shared/extensions/theme_extensions.dart';
import 'package:tanfeth_apps/common/shared/languages.dart';
import 'package:flutter/material.dart';



class DeleteAccountBottomSheetContent extends ConsumerWidget{
  @override
  Widget build(BuildContext context, WidgetRef ref) {
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
              LangEnum.areSureWantDeleteAccount.tr(),
            style: context.text.titleMedium,
          ),
          SizedBox(
            height: 16,
          ),


          Text(
            LangEnum.yourLoseAllData.tr(),
          ),


          SizedBox(
            height: 32,
          ),


          Center(
            child: SizedBox(
              height: 40,
              width: 200,
              child: ElevatedButton(
                style: const ButtonStyle().MinErrorElevatedButton(context),
                onPressed: () {

                },
                child: Text(
                  LangEnum.deleteAccount.tr(),
                  textScaler: TextScaler.noScaling,
                ),
              ),
            ),
          ),

          SizedBox(
            height: 10,
          ),
          Center(
            child: GestureDetector(
              behavior: HitTestBehavior.translucent,
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