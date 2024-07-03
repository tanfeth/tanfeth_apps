
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:tanfeth_apps/common/shared/extensions/padding_extension.dart';
import 'package:tanfeth_apps/common/shared/extensions/theme_extensions.dart';
import 'package:tanfeth_apps/common/shared/images.dart';
import 'package:tanfeth_apps/common/shared/languages.dart';
import 'package:tanfeth_apps/flavor/init_binding.dart';
import 'package:tanfeth_apps/travel/common/shared/routes/destination_route.dart';
import 'package:tanfeth_apps/travel/common/shared/routes/set_location_on_map_route.dart';
import 'package:tanfeth_apps/travel/taxi24/taxi24_driver/presentation/widget/small_divider.dart';

import 'package:tanfeth_apps/travel/taxi24/taxi24_passenger/presentation/view/complete_trip/widget/car_type_cell.dart';
import 'package:tanfeth_apps/travel/taxi24/taxi24_passenger/presentation/view/destination/vm/destination_list_vm.dart';
import 'package:tanfeth_apps/travel/taxi24/taxi24_passenger/presentation/view/home/vm/pick_up_location_vm.dart';
import 'package:tanfeth_apps/travel/taxi24/taxi24_passenger/presentation/view/home/widget/footer_car_list.dart';


class FooterWidget extends ConsumerStatefulWidget{
  const FooterWidget();

  @override
  ConsumerState<ConsumerStatefulWidget> createState()=> _FooterWidget();

}

class _FooterWidget extends ConsumerState<FooterWidget>{






  @override
  Widget build(BuildContext context) {

    return Container(
      height: 400,
      padding: EdgeInsets.symmetric(
        vertical: 10,
        horizontal: 15
      ),
      decoration: BoxDecoration(
        color: context.color.surface,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
        )
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [

          ///Car list
          Expanded(
            child: Column(
              children: [
                FooterCarList(),

                10.ph,
                SmallDivider(),

                ///Pick up location
                Container(
                  padding: EdgeInsets.all(10),
                  child: Row(
                    children: [
                      SvgPicture.asset(
                        Images.pickUp,
                      ),

                      10.pw,
                      Expanded(
                        child: Text(
                          ref.watch(pickUpLocationProvider).description??'',
                          style: context.text.bodyMedium,
                        ),
                      ),
                    ],
                  ),
                ),


                10.ph,

                InkWell(
                  onTap: (){
                    Get.toNamed(DestinationRouting.config().path);
                  },
                  child: Container(
                    padding: EdgeInsets.all(8),
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
                              if(ref.watch(destinationListProvider).isEmpty)...[
                                Expanded(
                                  child: Text(
                                    LangEnum.whereToGo.tr(),
                                    style: context.text.bodyLarge,
                                  ),
                                ),
                              ]else if(ref.watch(destinationListProvider).length == 1)...[
                                Expanded(
                                  child: Text(
                                    ref.watch(destinationListProvider)[0].description??'',
                                    style: context.text.bodyLarge,
                                    maxLines:2,
                                  ),
                                ),
                              ]else ...[
                                Expanded(
                                  child: Text(
                                    '${(ref.watch(destinationListProvider).length)} ${LangEnum.route.tr()}' ,
                                    style: context.text.bodyLarge,
                                    maxLines:2,
                                  ),
                                ),
                              ],
                            ],
                          ),
                        ),

                        GestureDetector(
                          onTap: (){

                            Get.toNamed(DestinationRouting.config().path);

                            // Get.toNamed(SetLocationOnMapRouting.config().path,
                            //     parameters: {
                            //       SetLocationOnMapRouting.pageType:
                            //       customAppFlavor.commonEnum.locationTypeEnum.destination
                            //     });
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
                ),

              ],
            ),
          ),



          ElevatedButton(
            onPressed: () async {

            },
            child: Text(LangEnum.findADriver.tr()),
          ),


          5.ph

        ],
      ),
    );
  }

}