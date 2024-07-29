import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:api_controller/presentation/widget/bottom_sheet/close_bottom_sheet_widget.dart';
import 'package:tanfeth_apps/common/presentation/widget/warning_widget.dart';
import 'package:api_controller/shared/extensions/padding_extension.dart';
import 'package:api_controller/shared/extensions/theme_extensions.dart';
import 'package:tanfeth_apps/common/shared/languages.dart';
import 'package:tanfeth_apps/travel/common/presentation/widget/circular_widget.dart';
import 'package:tanfeth_apps/travel/common/presentation/widget/show_bottom_sheet.dart';
import 'package:tanfeth_apps/travel/taxi24/taxi24_driver/shared/helper_methods.dart';


void rateSheet(
    {required BuildContext context,
    required bool hasWarning,
    required int sheetValue,
    required String rateTitle}) {

  showCustomBottomSheetMenu(
      context: context,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          Expanded(
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  10.ph,
                  const Center(child: CloseBottomSheetWidget()),
                  15.ph,
                  Text(
                    rateTitle,
                    style: context.text.titleMedium?.copyWith(
                        color: context.color.onSurface
                    ),
                    textAlign: TextAlign.start,
                  ),
                  SizedBox(height: 8,),
                  Text(
                    LangEnum.completedTrips.tr(),
                    style: context.text.titleMedium?.copyWith(
                        color: context.color.surfaceContainerHighest
                    ),
                    textAlign: TextAlign.start,
                    maxLines: 2,
                  ),

                  if (hasWarning)
                    SizedBox(height: 16,),
                  if (hasWarning)WarningWidget(
                      color:  sheetColor(value: sheetValue,context: context).withOpacity(.4),
                      borderColor:  sheetColor(value: sheetValue,context: context),
                      title: LangEnum.lowCompletionRate.tr()),

                  SizedBox(height: 50,),
                  Center(
                    child: CircularWidget(
                        color: sheetColor(value: sheetValue,context: context),
                        countText: "$sheetValue",
                        progress: sheetValue*.01),
                  ),
                  SizedBox(height: 20,),
                  Center(
                    child: Text(
                      LangEnum.today.tr(),
                      style: context.text.titleMedium?.copyWith(
                          color: context.color.surfaceContainerHighest
                      ),
                    ),
                  ),

                ],
              ),
            ),
          ),

          Center(
            child: GestureDetector(
              behavior: HitTestBehavior.translucent,
              onTap: () {
                Get.back();
              },
              child: Center(
                child:Text(
                  LangEnum.close.tr(),
                  style: context.text.titleLarge,
                ),
              ),
            ),
          ),

        ],
      ),
     );
}

