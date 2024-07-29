import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:api_controller/presentation/widget/bottom_sheet/close_bottom_sheet_widget.dart';
import 'package:tanfeth_apps/common/shared/extensions/padding_extension.dart';
import 'package:tanfeth_apps/common/shared/extensions/theme_extensions.dart';
import 'package:tanfeth_apps/common/shared/images.dart';
import 'package:tanfeth_apps/common/shared/languages.dart';

class CreditCardBottomSheetContent extends ConsumerStatefulWidget{
  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _CreditCardBottomSheetContent();


}

class _CreditCardBottomSheetContent extends ConsumerState<CreditCardBottomSheetContent>{
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          10.ph,
          const Center(child: CloseBottomSheetWidget()),
          10.ph,
          GestureDetector(
            behavior: HitTestBehavior.translucent,
            onTap: (){

            },
            child: Row(
              children: [
                SvgPicture.asset(
                  Images.starIconSVG,
                  height: 24,
                    width: 24,
                ),
                SizedBox(width: 16),
                Text(
                  LangEnum.setDefault.tr(),
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: context.color.onSurface
                  ),
                ),
              ],
            ),
          ),
          GestureDetector(
            behavior: HitTestBehavior.translucent,
            onTap:(){

            },
            child: Padding(
              padding:EdgeInsets.symmetric(vertical: 40),
              child: Row(
                children: [
                  SvgPicture.asset(
                    Images.deleteIconSVG,
                    width: 24,height: 24,
                  ),

                  SizedBox(width: 16,),
                  Text(
                    LangEnum.delete.tr(),
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: context.color.error
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: 30,),
          GestureDetector(
              behavior: HitTestBehavior.translucent,
              onTap: (){
                Navigator.pop(context);
              },
              child: Text(
                LangEnum.close.tr(),
                textAlign: TextAlign.center,
                style: context.text.titleMedium?.copyWith(
                    color: context.color.onSurface
                ),
              )
          ),
          SizedBox(height: 10,),

        ],
      ),
    );
  }

}