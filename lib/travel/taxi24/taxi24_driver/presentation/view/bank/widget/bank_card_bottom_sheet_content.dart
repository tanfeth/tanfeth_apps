
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:api_controller/presentation/widget/bottom_sheet/close_bottom_sheet_widget.dart';
import 'package:api_controller/shared/extensions/padding_extension.dart';
import 'package:api_controller/shared/extensions/theme_extensions.dart';
import 'package:tanfeth_apps/common/shared/images.dart';
import 'package:tanfeth_apps/common/shared/languages.dart';

class BankCardBottomSheetContent extends ConsumerStatefulWidget{
  const BankCardBottomSheetContent();

  @override
  ConsumerState<ConsumerStatefulWidget> createState()=> _BankCardBottomSheetContent();

}

class _BankCardBottomSheetContent extends ConsumerState<BankCardBottomSheetContent>{
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
              // Navigator.pushNamed(context, RoutePath.addbankModelScreen,arguments: {"bank":bankModel});
            },
            child: Row(
              children: [
                SvgPicture.asset(
                  Images.editPenSVG,width: 20,height: 20,
                ),
                SizedBox(width: 16,),
                Text(
                  LangEnum.edit.tr(),
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: context.color.onSurface
                  ),
                )
              ],
            ),
          ),
          GestureDetector(
            behavior: HitTestBehavior.translucent,
            onTap:(){

            },
            child: Padding(
              padding:EdgeInsets.symmetric(vertical: 20),
              child: Row(
                children: [
                  SvgPicture.asset(
                      Images.deleteIconSVG,width: 20,height: 20
                  ),
                  SizedBox(width: 16,),
                  Text(
                    LangEnum.delete.tr(),
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: context.color.error
                    ),
                  )

                ],
              ),
            ),
          ),
          SizedBox(height: 30,),
          GestureDetector(
            behavior: HitTestBehavior.translucent,
            onTap: (){
              Get.back();
            },
            child: Center(
                child: Text(
                  LangEnum.close.tr(),
                  style: context.text.titleLarge,
                )
            ),
          ),
          SizedBox(height: 10,),


        ],
      ),
    );
  }

}