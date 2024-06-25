
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:tanfeth_apps/common/presentation/widget/text_form_field_widget.dart';
import 'package:tanfeth_apps/common/shared/extensions/padding_extension.dart';
import 'package:tanfeth_apps/common/shared/images.dart';
import 'package:tanfeth_apps/common/shared/languages.dart';
import 'package:tanfeth_apps/flavor/init_binding.dart';
import 'package:tanfeth_apps/travel/common/shared/routes/set_location_on_map_route.dart';

class WhereToGoWidget extends ConsumerStatefulWidget{
  const WhereToGoWidget();
  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>_WhereToGoWidget();


}

class _WhereToGoWidget extends ConsumerState<WhereToGoWidget>{


  final destinationController = TextEditingController();
  final pickUpController = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return  Container(
      child: Column(
        children: [

          ///Current location
          CustomTextFormField(
            readOnly: true,
            controller: pickUpController,
            keyboardType: TextInputType.text,
            hintText: LangEnum.currentLocation.tr(),
            prefixWidget: Padding(
              padding:  EdgeInsets.symmetric(horizontal: 16),
              child: SvgPicture.asset(
                Images.pickUp,
                width: 25,
                height: 25,
              ),
            ),
            textInputAction: TextInputAction.next,
            onTap: (){
              Get.toNamed(SetLocationOnMapRouting.config().path,
              parameters: {
                SetLocationOnMapRouting.pageType:
                    customAppFlavor.commonEnum.locationTypeEnum.pickUp
              });
            },
          ),

          5.ph,

          /// Where to go?
          CustomTextFormField(
            controller: destinationController,
            readOnly: true,
            keyboardType: TextInputType.text,
            hintText: LangEnum.whereToGo.tr(),
            prefixWidget: Padding(
              padding:  EdgeInsets.symmetric(horizontal: 16),
              child: SvgPicture.asset(
                Images.formFieldCircleSVG,
                width: 25,
                height: 25,
              ),
            ),
            suffixIcon: Icons.add,
            suffixOnTap: (){
              Get.toNamed(SetLocationOnMapRouting.config().path,
                  parameters: {
                    SetLocationOnMapRouting.pageType:
                    customAppFlavor.commonEnum.locationTypeEnum.destination
                  });
            },
            textInputAction: TextInputAction.done,
            onTap: (){
              Get.toNamed(SetLocationOnMapRouting.config().path,
                  parameters: {
                    SetLocationOnMapRouting.pageType:
                    customAppFlavor.commonEnum.locationTypeEnum.destination
                  });
            },),
        ],
      ),
    );
  }

}