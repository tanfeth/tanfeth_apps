import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:api_controller/shared/extensions/theme_extensions.dart';
import 'package:tanfeth_apps/common/shared/images.dart';
import 'package:tanfeth_apps/common/shared/languages.dart';
import 'package:tanfeth_apps/flavor/init_binding.dart';
import 'package:tanfeth_apps/travel/common/shared/routes/set_location_on_map_route.dart';

class SetOnMapWidget extends ConsumerStatefulWidget{
  const SetOnMapWidget();

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _SetOnMapWidget();
}

class _SetOnMapWidget extends ConsumerState<SetOnMapWidget>{
  @override
  Widget build(BuildContext context) {
  return GestureDetector(
    onTap: (){
      Get.toNamed(SetLocationOnMapRouting.config().path,
      parameters: {
        SetLocationOnMapRouting.pageType:
            customAppFlavor.commonEnum.locationTypeEnum.destination
      });
    },
    child: Align(
      alignment: AlignmentDirectional.bottomCenter,
      child: Container(
        height: 48,
        decoration: BoxDecoration(
            color: context.color.surface,
            border: Border(top: BorderSide(color:context.color.surfaceContainerHighest,
                width: 2 ))
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(
              Images.pickOnMapSVG,
                width: 16,height: 16
            ),
            SizedBox(width: 12,),
            Text(
              LangEnum.setOnMap.tr(),
              style: context.text.bodyLarge,
            ),
          ],
        ),
      ),
    ),
  );
  }

}