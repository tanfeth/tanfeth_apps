

import 'package:flutter/material.dart';
import 'package:tanfeth_apps/common/shared/extensions/padding_extension.dart';
import 'package:tanfeth_apps/common/shared/extensions/theme_extensions.dart';
import 'package:tanfeth_apps/common/shared/helper_methods.dart';
import 'package:tanfeth_apps/common/shared/images.dart';
import 'package:tanfeth_apps/common/shared/languages.dart';
import 'package:tanfeth_apps/travel/taxi24/taxi24_passenger/presentation/view/profile/widget/rate_wadget.dart';

class DriverInfoWidget extends StatelessWidget {
  const DriverInfoWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            children: [
              ClipOval(
                  child: SizedBox(
                  width: 65,
                  height: 65,
                  child: Image.asset(Images.driverImage, fit: BoxFit.fill,))),

              RateWidget(rateValue: 4.2,)
            ],
          ),
          8.pw,
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text('Abdelrhman Mobarak', style: context.text.titleMedium,),
                4.ph,
                Text('Black Toyota corolla', style: context.text.bodyMedium?.copyWith(color: context.color.surfaceContainerHighest),),
                4.ph,

              ],
            ),
          ),


          InkWell(
            onTap: (){
              makePhoneCall(
                  phoneNumber: '0544646113'
              );
            },
            child: Container(
              padding: EdgeInsets.all(5),
              decoration: BoxDecoration(
                color:context.color.inverseSurface,
                shape: BoxShape.circle,
              ),
              child: Icon(
                Icons.phone,
                size: 25,
                color: context.color.surface,
              ),
            ),
          ),

        ]);
  }
}
