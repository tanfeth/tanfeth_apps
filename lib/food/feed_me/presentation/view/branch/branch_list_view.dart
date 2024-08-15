

import 'package:api_controller/shared/extensions/padding_extension.dart';
import 'package:api_controller/shared/extensions/theme_extensions.dart';
import 'package:api_controller/shared/helper_methods.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:line_icons/line_icons.dart';
import 'package:tanfeth_apps/common/shared/images.dart';
import 'package:tanfeth_apps/common/shared/languages.dart';
import 'package:tanfeth_apps/travel/taxi24/taxi24_driver/presentation/widget/small_divider.dart';

class BranchListView extends ConsumerStatefulWidget{
  const BranchListView({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>_BranchListView();


}

class _BranchListView extends ConsumerState<BranchListView>{
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            ///Branches
            Text(LangEnum.branches.tr(),
            style: context.text.bodyLarge,),

            15.ph,

            ListView.separated(
              physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemBuilder: (context,index){
                  return InkWell(
                    splashColor: context.color.surface,
                    onTap: (){
                      openMapNavigation(
                          lat: 26.399250,
                          lng: 49.984360);
                    },
                    child: Container(
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        borderRadius: const BorderRadius.all(Radius.circular(15)),
                        border: Border.all(width: 1,
                        color: context.color.primary)
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Expanded(
                                child: Text('فرع الدمام',
                                style: context.text.bodyLarge,),
                              ),

                               Icon(
                                LineIcons.directions,
                                size: 20,
                                color: context.color.primary,
                              )
                            ],
                          ),

                          10.ph,
                          Text(
                            'بجوار مارينا مول - بواية ٣',
                            style: TextStyle(
                              color: context.color.tertiaryContainer
                            ),
                          )
                        ],
                      ),
                    ),
                  );
                },
                separatorBuilder: (context,index)=> 10.ph,
                itemCount: 3),


            30.ph,

            ///Working time
            Row(
              children: [
                Text('${LangEnum.workTime.tr()}  :',
                  style: context.text.bodyLarge,),

                10.pw,
                Text('يوميا 24 ساعة'),
              ],
            ),


            15.ph,

            ///Services
            Text(LangEnum.services.tr(),
              style: context.text.bodyLarge,),

            10.ph,

            SizedBox(
              height: 40,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                  itemBuilder: (context,index){
                  return Container(
                    padding: const EdgeInsets.symmetric(horizontal: 20,
                    vertical: 10),
                    decoration: BoxDecoration(
                        borderRadius: const BorderRadius.all(Radius.circular(10)),
                        border: Border.all(width: 1,
                            color: context.color.primary)
                    ),
                    child:  Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          index ==0 ?
                          Images.deliveryBike
                          :Images.takeAway,
                          height: 20,
                          width: 20,
                        ),
                        15.pw,
                        Text(
                          index ==0 ?
                          LangEnum.homeDelivery.tr():
                          LangEnum.fromRestaurant.tr(),
                          style: TextStyle(
                            color: context.color.onSurface,
                          ),
                        )
                      ],
                    ),
                  );
                  },
                  separatorBuilder: (context,index)=> 10.pw,
                  itemCount: 2),
            ),



            // ///Food sections
            // Text(LangEnum.foodSections.tr(),
            //   style: context.text.bodyLarge,),
            //
            // 10.ph,
            //
            // SizedBox(
            //   height: 40,
            //   child: ListView.separated(
            //       scrollDirection: Axis.horizontal,
            //       itemBuilder: (context,index){
            //         return Container(
            //           padding: const EdgeInsets.symmetric(horizontal: 20,
            //               vertical: 10),
            //           decoration: BoxDecoration(
            //               borderRadius: const BorderRadius.all(Radius.circular(10)),
            //               border: Border.all(width: 1,
            //                   color: context.color.primary)
            //           ),
            //           child:  Row(
            //             mainAxisAlignment: MainAxisAlignment.center,
            //             children: [
            //               Image.asset(
            //                 index ==0 ?
            //                 Images.deliveryBike
            //                     :Images.takeAway,
            //                 height: 20,
            //                 width: 20,
            //               ),
            //               15.pw,
            //               Text(
            //                 index ==0 ?
            //                 LangEnum.homeDelivery.tr():
            //                 LangEnum.fromRestaurant.tr(),
            //                 style: TextStyle(
            //                   color: context.color.onSurface,
            //                 ),
            //               )
            //             ],
            //           ),
            //         );
            //       },
            //       separatorBuilder: (context,index)=> 10.pw,
            //       itemCount: 2),
            // ),




          ],
        ),
      ),
    );
  }

}