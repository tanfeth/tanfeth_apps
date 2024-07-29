import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:tanfeth_apps/common/shared/extensions/button_extensions.dart';
import 'package:api_controller/shared/extensions/padding_extension.dart';
import 'package:api_controller/shared/extensions/theme_extensions.dart';
import 'package:tanfeth_apps/common/shared/images.dart';
import 'package:tanfeth_apps/common/shared/languages.dart';


class EmptyFavoriteList extends StatelessWidget {
  const EmptyFavoriteList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SvgPicture.asset(Images.userWithMapSVG, width: 200, height: 200),
        28.ph,
        Text(LangEnum.noPlace.tr(),style: context.text.titleMedium,),
        8.ph,
        Text(LangEnum.addAddressToFavourite.tr(),textAlign: TextAlign.center,
          style: context.text.bodySmall,),
        24.ph,
        SizedBox(
          width: 150,
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
                Text(LangEnum.addPlace.tr(),style: context.text.titleMedium,),
              ],
            ),
          ),
        ),

      ],
    );
  }
}
