

import 'package:flutter/material.dart';
import 'package:tanfeth_apps/common/shared/extensions/padding_extension.dart';
import 'package:tanfeth_apps/common/shared/languages.dart';
import 'package:tanfeth_apps/travel/taxi24/taxi24_driver/presentation/view/profile/widget/profile_data_widget.dart';
import 'package:tanfeth_apps/travel/taxi24/taxi24_driver/presentation/view/profile/widget/rate_sheet.dart';

class ProfileRate extends StatelessWidget {
  const ProfileRate({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: GestureDetector(
              behavior: HitTestBehavior.translucent,
              onTap: () {
                rateSheet(
                    context: context,
                    hasWarning: false,
                    rateTitle: LangEnum.compilationRate.tr(),
                    sheetValue: 5);
              },
              child: ProfileDataWidget(
                percentNumber: 10,
                title: LangEnum.compilationRate.tr(),)),
        ),

        20.pw,
        Expanded(
          child: GestureDetector(
              behavior: HitTestBehavior.translucent,
              onTap: () {
                rateSheet(
                    context: context,
                    hasWarning: false,
                    rateTitle: LangEnum.acceptanceRate.tr(),
                    sheetValue:  5);
              },
              child: ProfileDataWidget(
                percentNumber: 10,
                title: LangEnum.acceptanceRate.tr(),
              )),
        ),
      ],
    );
  }
}
