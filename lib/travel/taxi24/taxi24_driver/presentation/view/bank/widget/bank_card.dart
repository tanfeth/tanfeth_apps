import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:api_controller/presentation/widget/bottom_sheet/show_bottom_sheet.dart';
import 'package:tanfeth_apps/common/shared/extensions/theme_extensions.dart';
import 'package:tanfeth_apps/common/shared/images.dart';
import 'package:tanfeth_apps/travel/taxi24/taxi24_driver/data/model/BankModel.dart';
import 'package:tanfeth_apps/travel/taxi24/taxi24_driver/presentation/view/bank/widget/bank_card_bottom_sheet_content.dart';


class BankCard extends StatelessWidget {

  final BankModel bankModel;
  final bool select;
  final bool isSelect;

  BankCard({
    this.select=false,
    required this.bankModel,
    this.isSelect=false,
    Key? key}) : super(key: key);



  @override
  Widget build(BuildContext context) {
    return  Row(
      children: [
        Expanded(
          child: Row(
            children: [
              SvgPicture.asset(
                  Images.bankCardSVG,
                  width: 24,
                  height: 24
              ),
              SizedBox(width: 16,),
              Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    bankModel.bank??"",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: context.color.onSurface
                    ),
                  ),

                  SizedBox(height: 4,),

                  Text(
                    bankModel.iBan??"",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: context.color.surfaceContainerHighest
                    ),
                  ),

                ],
              ),
            ],
          ),
        ),
      
        
        if(!isSelect)   GestureDetector(
            behavior: HitTestBehavior.translucent,
            onTap: (){

              showBottomSheetFunction(
                content: BankCardBottomSheetContent(),
              );
            },
            child: SvgPicture.asset(
             Images.dotsSVG,
                height: 24,
                width: 24
                  ))

      ],
    );
  }
}
