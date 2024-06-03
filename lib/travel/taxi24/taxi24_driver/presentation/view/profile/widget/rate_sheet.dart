import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tanfeth_apps/common/presentation/widget/warning_widget.dart';
import 'package:tanfeth_apps/common/shared/extensions/theme_extensions.dart';
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
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 16,),
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
            SizedBox(height: 32,),
            Center(
              child: CircularWidget(
                  color: sheetColor(value: sheetValue,context: context),
                  countText: "$sheetValue",
                  progress: sheetValue*.01),
            ),
            SizedBox(height: 16,),
            Center(
              child: Text(
                LangEnum.today.tr(),
                maxLines: 2,
                style: context.text.titleMedium?.copyWith(
                    color: context.color.surfaceContainerHighest
                ),
              ),
            ),
            SizedBox(height: 40,),
            Center(
              child: GestureDetector(
                behavior: HitTestBehavior.translucent,
                onTap: () {
                  Navigator.pop(context);
                },
                child: Center(
                  child:Text(
                    LangEnum.close.tr(),
                    style: context.text.titleLarge,
                  ),
                ),
              ),
            ),
            SizedBox(height: 16,),
          ],
        ),
      ),
      height: hasWarning ? 600 : 400);
}

