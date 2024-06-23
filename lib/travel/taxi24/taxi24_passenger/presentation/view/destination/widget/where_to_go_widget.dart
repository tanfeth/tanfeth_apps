
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tanfeth_apps/common/presentation/widget/text_form_field_widget.dart';
import 'package:tanfeth_apps/common/shared/extensions/padding_extension.dart';
import 'package:tanfeth_apps/common/shared/extensions/theme_extensions.dart';
import 'package:tanfeth_apps/common/shared/images.dart';
import 'package:tanfeth_apps/common/shared/languages.dart';
import 'package:tanfeth_apps/travel/taxi24/taxi24_driver/presentation/widget/small_divider.dart';

class WhereToGoWidget extends ConsumerStatefulWidget{
  const WhereToGoWidget();
  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>_WhereToGoWidget();


}

class _WhereToGoWidget extends ConsumerState<WhereToGoWidget>{


  final destinationController = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return  Container(
      // decoration: BoxDecoration(
      //     border:Border.all(color:
      //     context.color.surfaceContainerHighest.withOpacity(0.4),
      //         width:2),
      //     borderRadius: BorderRadius.circular(8)
      // ),
      child: Column(
        children: [
          ///Current location
          CustomTextFormField(
            readOnly: true,
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
            textInputAction: TextInputAction.next,),

          5.ph,

          /// Where to go?
          CustomTextFormField(
            controller: destinationController,
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
            textInputAction: TextInputAction.done,
            onChanged: (val){},),
        ],
      ),
    );
  }

}