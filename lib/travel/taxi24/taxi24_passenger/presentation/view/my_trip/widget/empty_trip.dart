import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:tanfeth_apps/common/shared/extensions/padding_extension.dart';
import 'package:tanfeth_apps/common/shared/extensions/theme_extensions.dart';
import 'package:tanfeth_apps/common/shared/images.dart';
import 'package:tanfeth_apps/common/shared/languages.dart';

class EmptyTrip extends StatelessWidget {
  const EmptyTrip ({super.key});
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(Images.emptyTrip, width: 220, height: 155,),
          28.ph,
          Text(LangEnum.theyReceiveTripInfoTextMmessage.tr(),style: context.text.titleMedium,),
          9.ph,
          Text("Your recent and cancelled trips will appear here",style: context.text.bodyMedium?.copyWith(color: context.color.surfaceContainerHighest)),
        ],
      ),
    );
  }
}
