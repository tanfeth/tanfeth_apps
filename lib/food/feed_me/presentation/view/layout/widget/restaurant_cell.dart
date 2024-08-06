


import 'package:api_controller/shared/extensions/padding_extension.dart';
import 'package:api_controller/shared/extensions/theme_extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tanfeth_apps/common/shared/images.dart';
import 'package:tanfeth_apps/food/feed_me/data/model/layout/RestaurantModel.dart';

class RestaurantCell extends ConsumerStatefulWidget{
  final RestaurantModel model;

  const RestaurantCell({super.key,required this.model});

  @override
  ConsumerState<ConsumerStatefulWidget> createState()=>_RestaurantCell();


}

class _RestaurantCell extends ConsumerState<RestaurantCell>{
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Container(
       // padding: const EdgeInsets.all(10),
        margin: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 8
        ),
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(8)),
          border: Border.all(
            width: 1,
            color: context.color.error
          )
        ),
        child: Column(
          children: [
            Row(
              children: [
                ///Image
                Container(
                  width: 80,
                  height: 80,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(Images.resturant)
                    )
                  ),
                ),
      
                10.pw,
                
                ///Name
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Icon(
                            Icons.verified,
                            size: 20,
                            color: context.color.tertiaryContainer,
                          ),
                          5.pw,
                          Text(widget.model.name??'',
                          style: context.text.bodyLarge,)
                        ],
                      ),
      
                      5.ph,
                      Text(
                        'كريب - بيتزا - ساندوتشات - صالة',
                        style: TextStyle(
                          color: context.color.surfaceContainerHighest
                        ),
                      )
                  
                    ],
                  ),
                ),
      
      
                InkWell(
                  onTap: (){
      
                  },
                  child: Container(
                    padding: const EdgeInsets.all(5),
                    decoration: BoxDecoration(
                      color: context.color.primary,
                      borderRadius: const BorderRadius.only(
                        topRight: Radius.circular(15),
                        bottomRight: Radius.circular(15),
                      ),
                    ),
                    child: Center(
                      child: Icon(
                        Icons.favorite_border,
                        color: context.color.onPrimary,
                      ),
                    ),
                  ),
                ),
              ],
            ),
      
      
      
            Container(
              decoration: BoxDecoration(
                color: context.color.secondary,
                  borderRadius: const BorderRadius.only(
                      bottomLeft:Radius.circular(8),
                  bottomRight: Radius.circular(8),),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    ///Rating
                    Expanded(
                      child: Row(
                        children: [
                          ...List.generate(5,
                            (index) => Icon(
                              Icons.star,
                              size: 15,
                              color: context.color.error,
                            )
                          ),
                          5.pw,
      
                           Text(widget.model.rate.toString())
                        ],
                      ),
                    ),
      
      
                    ///Available
      
                    Row(
                      children: [
                        Icon(
                          Icons.shopping_cart,
                          color: context.color.error,
                          size: 20,
                        ),
                        5.pw,
                        const Text(
                          'متاح الى الساعه ٣:٠٠ ص'
                        ),
                      ],
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

}