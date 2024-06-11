

import 'package:flutter/material.dart';
import 'package:tanfeth_apps/common/shared/extensions/padding_extension.dart';
import 'package:tanfeth_apps/common/shared/helper_methods.dart';
import 'package:tanfeth_apps/common/shared/languages.dart';
import 'package:tanfeth_apps/travel/taxi24/taxi24_driver/presentation/view/profile/widget/profile_data_widget.dart';
import 'package:tanfeth_apps/travel/taxi24/taxi24_driver/presentation/view/profile/widget/rate_sheet.dart';
import 'package:showcaseview/showcaseview.dart';


class ProfileRate extends StatefulWidget {
  final  GlobalKey five;
  final  GlobalKey six;
  const ProfileRate({super.key,
  required this.five,
  required this.six});

  @override
  State<ProfileRate> createState() => _ProfileRateState();
}

class _ProfileRateState extends State<ProfileRate> {



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
                    sheetValue: 50);
              },
              child: Showcase(
                key: widget.five,
                description: LangEnum.compilationRateOption.tr(),
                child: ProfileDataWidget(
                  percentNumber: 50,
                  title: LangEnum.compilationRate.tr(),),
              )),
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
                    sheetValue:  50);
              },
              child: Showcase(
                key: widget.six,
                description: LangEnum.acceptanceRateOption.tr(),
                child: ProfileDataWidget(
                  percentNumber: 50,
                  title: LangEnum.acceptanceRate.tr(),
                ),
              )),
        ),
      ],
    );
  }
}
