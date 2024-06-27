
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:tanfeth_apps/common/shared/extensions/padding_extension.dart';
import 'package:tanfeth_apps/common/shared/extensions/theme_extensions.dart';
import 'package:tanfeth_apps/common/shared/images.dart';
import 'package:tanfeth_apps/common/shared/languages.dart';
import 'package:tanfeth_apps/flavor/init_binding.dart';
import 'package:tanfeth_apps/travel/common/shared/routes/set_location_on_map_route.dart';
import 'package:tanfeth_apps/travel/taxi24/taxi24_passenger/presentation/view/destination/vm/destination_list_vm.dart';
import 'package:tanfeth_apps/travel/taxi24/taxi24_passenger/presentation/view/destination/widget/destination_list.dart';

class WhereToGoWidget extends ConsumerStatefulWidget{
  const WhereToGoWidget();
  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>_WhereToGoWidget();


}

class _WhereToGoWidget extends ConsumerState<WhereToGoWidget>{

  @override
  Widget build(BuildContext context) {
    return  Column(
      children: [
        //
        // Padding(
        //   padding:  EdgeInsets.symmetric(horizontal: 8,),
        //   child: Container(
        //     padding: EdgeInsets.all(10),
        //     decoration: BoxDecoration(
        //         borderRadius: BorderRadius.all(Radius.circular(10)),
        //         border: Border.all(
        //             color: context.color.surfaceContainerHighest
        //         )
        //     ),
        //     child:   GestureDetector(
        //       onTap: (){
        //         Get.toNamed(SetLocationOnMapRouting.config().path,
        //             parameters: {
        //               SetLocationOnMapRouting.pageType:
        //               customAppFlavor.commonEnum.locationTypeEnum.pickUp
        //             });
        //       },
        //       child: Row(
        //         children: [
        //           Expanded(
        //             child: Row(
        //               children: [
        //                 SvgPicture.asset(
        //                   Images.pickUp,
        //                   width: 23,
        //                   height: 23,
        //                 ),
        //                 20.pw,
        //                 Text(
        //                   LangEnum.currentLocation.tr(),
        //                   style: context.text.bodyLarge,
        //                 ),
        //               ],
        //             ),
        //           ),
        //         ],
        //       ),
        //     ),
        //   ),
        // ),
        //
        // 10.ph,


        // ///Current location
        // CustomTextFormField(
        //   readOnly: true,
        //   controller: pickUpController,
        //   keyboardType: TextInputType.text,
        //   hintText: LangEnum.currentLocation.tr(),
        //   prefixWidget: Padding(
        //     padding:  EdgeInsets.symmetric(horizontal: 16),
        //     child: SvgPicture.asset(
        //       Images.pickUp,
        //       width: 25,
        //       height: 25,
        //     ),
        //   ),
        //   textInputAction: TextInputAction.next,
        //   onTap: (){
        //     Get.toNamed(SetLocationOnMapRouting.config().path,
        //     parameters: {
        //       SetLocationOnMapRouting.pageType:
        //           customAppFlavor.commonEnum.locationTypeEnum.pickUp
        //     });
        //   },
        // ),
        //
        // 5.ph,

        /// Where to go?
        Padding(
          padding:  EdgeInsets.symmetric(horizontal: 8,),
          child: Container(
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(10)),
                border: Border.all(
                  color: context.color.surfaceContainerHighest
                )
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                GestureDetector(
                  onTap: (){
                    Get.toNamed(SetLocationOnMapRouting.config().path,
                        parameters: {
                          SetLocationOnMapRouting.pageType:
                          customAppFlavor.commonEnum.locationTypeEnum.destination
                        });
                  },
                  child: Row(
                    children: [
                      Expanded(
                        child: Row(
                          children: [
                            SvgPicture.asset(
                              Images.formFieldCircleSVG,
                              width: 23,
                              height: 23,
                            ),
                            20.pw,
                            Text(
                              LangEnum.whereToGo.tr(),
                              style: context.text.bodyLarge,
                            ),
                          ],
                        ),
                      ),

                      GestureDetector(
                        onTap: (){
                          Get.toNamed(SetLocationOnMapRouting.config().path,
                              parameters: {
                                SetLocationOnMapRouting.pageType:
                                customAppFlavor.commonEnum.locationTypeEnum.destination
                              });
                        },
                        child: Icon(
                          Icons.add,
                          size: 23,
                          color: context.color.onSurface,
                        ),
                      ),

                    ],
                  ),
                ),
                if(ref.watch(destinationListProvider).isNotEmpty)

                Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    15.ph,
                    DestinationList(),
                  ],
                )
              ],
            ),
          ),
        ),
      ],
    );
  }

}