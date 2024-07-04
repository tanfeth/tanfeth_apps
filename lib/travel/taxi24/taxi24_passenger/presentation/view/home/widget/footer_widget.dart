
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tanfeth_apps/common/presentation/widget/bottom_sheet/show_bottom_sheet.dart';
import 'package:tanfeth_apps/common/shared/extensions/padding_extension.dart';
import 'package:tanfeth_apps/common/shared/extensions/theme_extensions.dart';
import 'package:tanfeth_apps/common/shared/images.dart';
import 'package:tanfeth_apps/common/shared/languages.dart';
import 'package:tanfeth_apps/travel/common/shared/routes/complete_trip_route.dart';
import 'package:tanfeth_apps/travel/common/shared/routes/destination_route.dart';
import 'package:tanfeth_apps/travel/taxi24/taxi24_passenger/presentation/view/choose_ride/vm/car_type_vm.dart';

import 'package:tanfeth_apps/travel/taxi24/taxi24_passenger/presentation/view/destination/vm/destination_list_vm.dart';
import 'package:tanfeth_apps/travel/taxi24/taxi24_passenger/presentation/view/home/vm/pick_up_location_vm.dart';
import 'package:tanfeth_apps/travel/taxi24/taxi24_passenger/presentation/view/home/vm/toggle_animation_vm.dart';
import 'package:tanfeth_apps/travel/taxi24/taxi24_passenger/presentation/view/home/widget/footer_car_list.dart';
import 'package:tanfeth_apps/travel/taxi24/taxi24_passenger/presentation/view/home/widget/footer_pay_way_widget.dart';


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

                ///Pick up location
                InkWell(
                  onTap: (){
                    ref.read(destinationListProvider.notifier)
                    .clearList();
                    ref.read(toggleAnimationProvider.notifier)
                        .toggleConfirmFooterAnimate(true);
                    ref.read(toggleAnimationProvider.notifier)
                        .toggleTripFooterAnimate(false);
                  },
                  child: Container(
                    padding: EdgeInsets.all(10),
                    child: Row(
                      children: [
                        SvgPicture.asset(
                          Images.pickUp,
                          height: 20,
                            width: 20,
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
                ),


                10.ph,

                ///Destination widget
                InkWell(
                  onTap: (){
                    showBottomSheetFunction(
                      content:DestinationRouting.config().widget,
                    );
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
                                height: 20,
                                width: 20,
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
                            showBottomSheetFunction(
                              content:DestinationRouting.config().widget,
                            );
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

                10.ph,

                ///Pay way
                FooterPayWayWidget(),


              ],
            ),
          ),



          Row(
            children: [
              Expanded(
                child: ElevatedButton(
                  onPressed: () async {
                
                  },
                  child: Text(LangEnum.findADriver.tr()),
                ),
              ),

              if(ref.watch(destinationListProvider).isNotEmpty)
              Row(
                children: [
                  10.pw,
                  InkWell(
                    onTap: (){
                      showBottomSheetFunction(
                        content:CompleteTripRouting.config().widget,
                      );
                    },
                    child: Container(
                      height: 50,
                      width: 80,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(15)),
                          color: context.color.primary
                      ),
                      child: Column(
                        children: [
                          Text(
                            ref.watch(carTypeProvider) == 0?
                            '50':'70',
                            style: context.text.titleMedium?.copyWith(
                                color: context.color.onPrimary
                            ),
                          ),

                          Text(
                            LangEnum.sar.tr(),
                            style: TextStyle(
                                color: context.color.onPrimary
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),

            ],
          ),


          5.ph

        ],
      ),
    );
  }

}