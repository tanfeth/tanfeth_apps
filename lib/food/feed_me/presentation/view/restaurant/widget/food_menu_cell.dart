

import 'package:api_controller/presentation/widget/bottom_sheet/show_bottom_sheet.dart';
import 'package:api_controller/shared/extensions/padding_extension.dart';
import 'package:api_controller/shared/extensions/theme_extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tanfeth_apps/common/shared/images.dart';
import 'package:tanfeth_apps/common/shared/languages.dart';
import 'package:tanfeth_apps/food/feed_me/presentation/view/restaurant/widget/add_cart_bottom_sheet.dart';

class FoodMenuCell extends ConsumerStatefulWidget{
  const FoodMenuCell({super.key});


  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>_FoodMenuCell();


}

class _FoodMenuCell extends ConsumerState<FoodMenuCell>{
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          Container(
            width: 70,
            height: 70,
            margin: const EdgeInsets.symmetric(horizontal: 10),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(width: 1,
                  color: context.color.primary),
              image: DecorationImage(
                  image: AssetImage(Images.resturant),
                  fit: BoxFit.fill
              ),
            ),
          ),

          Expanded(
            child: Container(
              margin: const EdgeInsets.symmetric(
                  horizontal: 5,
                  vertical: 8
              ),
              decoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(Radius.circular(15)),
                  border: Border.all(
                      width: 1,
                      color: context.color.error
                  )
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [

                        Text("بيتزا مارجريتا",
                          style: context.text.bodyLarge,),

                        10.ph,
                        Text(
                          'كريب - بيتزا - ساندوتشات - صالة',
                          style: TextStyle(
                              color: context.color.surfaceContainerHighest
                          ),
                        ),


                      ],
                    ),
                  ),


                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [

                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 8
                          ),
                          child: Text(
                              '100 ريال',
                            style: context.text.bodyLarge,
                          ),
                        )
                        ,
                      ),
                      InkWell(
                        splashColor: context.color.surface,
                        onTap: (){
                          showBottomSheetFunction(
                            content:const  AddCartBottomSheet(),
                          );
                        },
                        child: Container(
                          padding:const  EdgeInsets.symmetric(
                            horizontal: 15,
                            vertical: 8
                          ),
                          decoration: BoxDecoration(
                              color: context.color.primary,
                              borderRadius: const  BorderRadius.only(
                                topRight: Radius.circular(10),
                                bottomRight: Radius.circular(10),
                              )
                          ),
                          child: Row(
                            children: [
                              Icon(
                                Icons.shopping_cart_outlined,
                                size: 20,
                                color: context.color.onPrimary,
                              ),

                              8.pw,
                              Text(
                                LangEnum.add.tr(),
                                style: context.text.bodyLarge?.copyWith(
                                    color: context.color.onPrimary
                                ),
                              )
                            ],
                          ),
                        ),
                      )
                    ],
                  )

                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

}