

import 'package:flutter/material.dart';
import 'package:api_controller/shared/extensions/padding_extension.dart';
import 'package:api_controller/shared/extensions/theme_extensions.dart';
import 'package:api_controller/shared/helper_methods.dart';
import 'package:tanfeth_apps/common/shared/images.dart';
import 'package:tanfeth_apps/common/shared/languages.dart';
import 'package:tanfeth_apps/travel/taxi24/taxi24_passenger/presentation/view/profile/widget/rate_wadget.dart';
import 'package:tanfeth_apps/travel/taxi24/taxi24_passenger/shared/show_case.dart';
import 'package:showcaseview/showcaseview.dart';
import 'package:tanfeth_apps/travel/taxi24/taxi24_passenger/shared/storage.dart';


class DriverInfoWidget extends StatefulWidget {
  const DriverInfoWidget({super.key});

  @override
  State<DriverInfoWidget> createState() => _DriverInfoWidgetState();
}

class _DriverInfoWidgetState extends State<DriverInfoWidget> {

  @override
  void initState() {
    if(TaxiPassengerAppStorage.getHomeFindDriverCase() == true){
      showCaseEvent(context: context,caseList: [
        showcaseKey6,
        showcaseKey7,
        showcaseKey8,
      ]);
    }
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Column(
            children: [
              ClipOval(
                  child: SizedBox(
                  width: 65,
                  height: 65,
                  child: Image.asset(Images.driverImage, fit: BoxFit.fill,))),

              const RateWidget(rateValue: 4.2,)
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


          Showcase(
            key: showcaseKey6,
            description: LangEnum.callDriverHint.tr(),
            child: InkWell(
              onTap: (){
                makePhoneCall(
                    phoneNumber: '0544646113'
                );
              },
              child: Container(
                padding: const EdgeInsets.all(4),
                margin: const EdgeInsets.all(5),
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
          ),

        ]);
  }
}
