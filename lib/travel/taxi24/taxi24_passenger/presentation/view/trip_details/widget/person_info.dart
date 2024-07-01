import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/svg.dart';
import 'package:tanfeth_apps/common/shared/extensions/padding_extension.dart';
import 'package:tanfeth_apps/common/shared/extensions/theme_extensions.dart';
import 'package:tanfeth_apps/common/shared/images.dart';
import 'package:tanfeth_apps/travel/taxi24/taxi24_passenger/presentation/view/profile/widget/rate_wadget.dart';

class PersonInfo extends StatelessWidget {
  const PersonInfo({super.key});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: 24.toVertical,
      child: Row(
        children: [
          ClipOval(child: SizedBox(width: 75, height: 75, child: Image.asset(Images.driverImage, fit: BoxFit.fill,))),
          16.pw,
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Name",style: context.text.titleMedium,),
                Text("Black Toyota corolla",style: context.text.bodyMedium,).vPadding(4),
                Text("driverNumber",style: context.text.bodyMedium,),
              ],
            ),
          ),
          RateWidget(rateValue: 1.2,)
        ],
      ),
    );
  }
}
