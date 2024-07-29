


import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:api_controller/shared/extensions/padding_extension.dart';
import 'package:api_controller/shared/extensions/theme_extensions.dart';
import 'package:api_controller/shared/helper_methods.dart';
import 'package:tanfeth_apps/common/shared/images.dart';
import 'package:tanfeth_apps/common/shared/languages.dart';
import 'package:tanfeth_apps/travel/taxi24/taxi24_passenger/presentation/view/destination/vm/destination_list_vm.dart';
import 'package:tanfeth_apps/travel/taxi24/taxi24_passenger/presentation/view/find_driver/vm/searching_vm.dart';
import 'package:tanfeth_apps/travel/taxi24/taxi24_passenger/presentation/view/find_driver/widget/searching_driver_widget.dart';
import 'package:tanfeth_apps/travel/taxi24/taxi24_passenger/presentation/view/find_driver/widget/trip_details_widget.dart';
import 'package:tanfeth_apps/travel/taxi24/taxi24_passenger/presentation/view/home/vm/pick_up_location_vm.dart';
import 'package:tanfeth_apps/travel/taxi24/taxi24_passenger/presentation/view/home/vm/toggle_animation_vm.dart';
import 'package:tanfeth_apps/travel/taxi24/taxi24_passenger/presentation/view/profile/widget/rate_wadget.dart';

class ComingTripWidget extends ConsumerStatefulWidget{
  const ComingTripWidget({super.key});


  @override
  ConsumerState<ConsumerStatefulWidget> createState()=> _ComingTripWidget();

}

class _ComingTripWidget extends ConsumerState<ComingTripWidget>{
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
      decoration: BoxDecoration(
          color: context.color.surface,
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(30),
            topRight: Radius.circular(30),
          )),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [


          Expanded(
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [

                  8.ph,
                  ///Trip header
                  Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [

                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text('15 ${LangEnum.sar.tr()}', style: context.text.titleMedium,),
                              4.ph,
                              Text('6 ${LangEnum.minute.tr()} - 2.3 ${LangEnum.km.tr()}', style: context.text.bodyMedium?.copyWith(color: context.color.surfaceContainerHighest),),
                              4.ph,

                            ],
                          ),
                        ),


                        Column(
                          children: [
                            ClipOval(
                                child: SizedBox(
                                    width: 50,
                                    height: 50,
                                    child: Image.asset(Images.driverImage, fit: BoxFit.fill,))),
                               8.ph,
                            const RateWidget(rateValue: 4.2,)
                          ],
                        ),

                      ]),

                  20.ph,

                  ///Pick up location
                  Container(
                    padding: const EdgeInsets.all(10),
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
                            ref.watch(pickUpLocationProvider).description ??
                                'الدمام - السعودية',
                            style: context.text.bodyMedium,
                          ),
                        ),
                      ],
                    ),
                  ),


                  ///Destination location
                  Container(
                    padding: const EdgeInsets.all(10),
                    child: Column(
                      children:[
                        ...List.generate(1, (index)=>
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 5),
                              child: Row(
                                children: [
                                  SvgPicture.asset(
                                    Images.formFieldCircleSVG,
                                    height: 20,
                                    width: 20,
                                  ),
                                  10.pw,
                                  const Expanded(
                                    child: Text(
                                      // ref
                                      //     .watch(destinationListProvider)[index]
                                      //     .description ??
                                      'الدمام - السعودية',
                                      maxLines: 2,
                                    ),)
                                ],
                              ),
                            )),
                      ],
                    ),
                  ),

                  8.ph,

                ],
              ),
            ),
          ),

          Row(
            children: [
              Expanded(
                child:   ElevatedButton(
                  onPressed: () async {

                  },
                  child: Text(LangEnum.accept.tr()),
                ),
              ),

              15.pw,
              Expanded(
                child:   ElevatedButton(
                  onPressed: () async {
                    ref.read(searchingProvider.notifier).
                    changeCurrentIndex(0);

                  },
                  style: ButtonStyle(
                    backgroundColor: WidgetStateProperty.all<Color?>(context.color.error),
                  ),
                  child: Text(LangEnum.decline.tr()),
                ),
              ),


            ],
          ),

          8.ph,
        ],
      ),
    );
  }

}