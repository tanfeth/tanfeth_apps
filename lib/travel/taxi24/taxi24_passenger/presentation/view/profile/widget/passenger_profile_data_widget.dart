import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tanfeth_apps/common/shared/extensions/padding_extension.dart';
import 'package:tanfeth_apps/common/shared/extensions/theme_extensions.dart';
import 'package:tanfeth_apps/common/shared/images.dart';
import 'package:tanfeth_apps/common/shared/languages.dart';
import 'package:showcaseview/showcaseview.dart';
import 'package:tanfeth_apps/travel/taxi24/taxi24_passenger/presentation/view/profile/widget/rate_wadget.dart';

class PassengerProfileDataWidget extends StatelessWidget {



  const PassengerProfileDataWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ClipOval(child: SizedBox(
              width: 75,
              height: 75,
              child: Image.asset(Images.driverImage, fit: BoxFit.fill,))),
          8.pw,
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('kareem mohamed', style: context.text.titleMedium,),
                4.ph,
                Text('kareemmohmed299@gmail.com', style: context.text.bodyMedium?.copyWith(color: context.color.surfaceContainerHighest),),
              ],
            ),
          ),
          RateWidget(rateValue: 1.2,)
        ]);
  }
}
