
import 'dart:ui';

import 'package:api_controller/shared/extensions/padding_extension.dart';
import 'package:api_controller/shared/extensions/theme_extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tanfeth_apps/common/shared/images.dart';
import 'package:tanfeth_apps/common/shared/languages.dart';


class RestaurantProfileHeader extends ConsumerStatefulWidget{
  const RestaurantProfileHeader({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>_RestaurantProfileHeader();


}

class _RestaurantProfileHeader extends ConsumerState<RestaurantProfileHeader>{

  var top = 0.0;



  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          top = constraints.biggest.height;
          return FlexibleSpaceBar(
              centerTitle: true,
              titlePadding: const EdgeInsets.only(
                top: 50
              ),
              title: AnimatedOpacity(
                  duration: const Duration(milliseconds: 500),
                  opacity: 1.0,
                  child:top == 80?
                  Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.verified,
                      size: 20,
                      color: context.color.tertiaryContainer,
                    ),
                    10.pw,
                    Text(
                      'تورتيلا فرايد اتشيكن',
                      textAlign: TextAlign.center,
                      style: context.text.titleMedium?.copyWith(
                          color: context.color.onSurface
                      ),)
                  ],
                                      ):
                  const SizedBox.shrink()
                ),
                background: Container(
                decoration: BoxDecoration(
                    image: DecorationImage(
                      image: ExactAssetImage(Images.resturant),
                      fit: BoxFit.cover,
                    )
                ),
                child: BackdropFilter(
                  filter:  ImageFilter.blur(sigmaX: 3.0, sigmaY: 3.0),
                  child:  Container(
                    decoration: BoxDecoration(color: Colors.black.withOpacity(0.7)),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [

                              Container(
                                width: 60,
                                height: 60,
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
                              15.pw,
                              Icon(
                                Icons.verified,
                                size: 20,
                                color: context.color.tertiaryContainer,
                              ),
                              10.pw,
                              Text(
                                'تورتيلا فرايد اتشيكن',
                                style: context.text.titleMedium?.copyWith(
                                    color: Colors.white
                                ),)
                            ],
                          ),

                          Padding(
                            padding: const EdgeInsets.symmetric(
                              // horizontal: 30,
                                vertical: 10
                            ),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [

                                Expanded(
                                  child: Row(
                                    children: [
                                      const  Icon(
                                        Icons.alarm,
                                        size: 25,
                                        color: Colors.white,
                                      ),

                                      10.pw,
                                      Text(
                                        'متاح من 10 ص الى 3 ص',
                                        style: context.text.bodyLarge?.copyWith(
                                            color: Colors.white
                                        ),
                                      )
                                    ],
                                  ),
                                ),

                                Row(
                                  children: [
                                    Image.asset(
                                      Images.deliveryBike,
                                      height: 20,
                                      width: 20,
                                    ),

                                    10.pw,
                                    Text(
                                      LangEnum.availableDelivery.tr(),
                                      style: context.text.bodyLarge?.copyWith(
                                          color: Colors.white
                                      ),
                                    )
                                  ],
                                ),


                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ));
        }
    );
  }

}


