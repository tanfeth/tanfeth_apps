import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:tanfeth_apps/common/shared/extensions/button_extensions.dart';
import 'package:tanfeth_apps/common/shared/extensions/padding_extension.dart';
import 'package:tanfeth_apps/common/shared/extensions/theme_extensions.dart';
import 'package:tanfeth_apps/common/shared/images.dart';
import 'package:tanfeth_apps/common/shared/languages.dart';

class EmptyCard extends StatelessWidget {
  const EmptyCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SvgPicture.asset(Images.cardsSVG, height: 150, width: 150,),
        Text(LangEnum.noCard.tr(),style: context.text.titleMedium),
        8.ph,
        Text(LangEnum.addCardList.tr(),textAlign: TextAlign.center,),
        16.ph,
        SizedBox(
          width: 160,
          child: ElevatedButton(
            style: const ButtonStyle().GreyOutlinedButton(context)?.copyWith(
              backgroundColor: WidgetStateProperty.all<Color?>(context.color.surface),
              foregroundColor: WidgetStateProperty.all<Color?>(context.color.onSurface),
            ),
            onPressed: () {
              // Get.toNamed(SendMessageRouting.config().path);
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgPicture.asset(Images.plusIconSVG, width: 16, height: 16),
                12.pw,
                Text(LangEnum.addCards.tr(),style: context.text.titleMedium,),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
