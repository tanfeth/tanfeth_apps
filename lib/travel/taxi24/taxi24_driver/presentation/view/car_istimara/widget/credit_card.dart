import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tanfeth_apps/common/presentation/widget/bottom_sheet/show_bottom_sheet.dart';
import 'package:tanfeth_apps/common/shared/extensions/theme_extensions.dart';
import 'package:tanfeth_apps/common/shared/images.dart';
import 'package:tanfeth_apps/common/shared/languages.dart';
import 'package:tanfeth_apps/travel/taxi24/taxi24_driver/data/model/CardModel.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tanfeth_apps/travel/taxi24/taxi24_driver/presentation/view/car_istimara/widget/credit_card_bottom_sheet_content.dart';


class CreditCard extends ConsumerWidget {

  final CardModel cardModel;
  final bool select;
  final bool isSelect;
  final bool isArrow;

  CreditCard({
    this.select=false,
    required this.cardModel,
    this.isSelect=false,
    this.isArrow=false,
    Key? key}) : super(key: key);



  @override
  Widget build(BuildContext context,ref) {
    return   Row(
      children: [
        SvgPicture.asset(
          Images.mastercardSVG,
          height: 24,
          width: 24,
        ),
        SizedBox(width: 16,),

        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                cardModel.name??"",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: context.color.onSurface
                ),
              ),

              Text(
                LangEnum.defaultWord.tr(),
                textAlign: TextAlign.start,
                style: TextStyle(
                    color: context.color.surfaceContainerHighest
                ),
              ),
            ],
          ),
        ),

        if(isSelect)Container(
          height: 20,
          width: 20,
          decoration: !select?
          BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              border: Border.all(
                  color: context.color.surfaceContainerHighest,width: 2)
          ):BoxDecoration(
              color: context.color.onSurface,
              borderRadius: BorderRadius.circular(16),
              border: Border.all(color: context.color.primary,width: 6)
          ),),
        if(isArrow) Icon(Icons.arrow_forward_ios_outlined,size: 14,),
        if(!isSelect)   GestureDetector(
            behavior: HitTestBehavior.translucent,
            onTap: (){
              showBottomSheetFunction(
                content: CreditCardBottomSheetContent(
                ),
              );
            },
            child:SvgPicture.asset(
                Images.dotsSVG,
            height: 24,width: 24
             ))
      ],
    );
  }
}
