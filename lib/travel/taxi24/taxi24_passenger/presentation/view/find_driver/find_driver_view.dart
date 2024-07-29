import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/get.dart';
import 'package:api_controller/presentation/widget/bottom_sheet/close_bottom_sheet_widget.dart';
import 'package:api_controller/presentation/widget/bottom_sheet/show_bottom_sheet.dart';
import 'package:api_controller/shared/extensions/padding_extension.dart';
import 'package:api_controller/shared/extensions/theme_extensions.dart';
import 'package:tanfeth_apps/common/shared/languages.dart';
import 'package:tanfeth_apps/travel/taxi24/taxi24_passenger/presentation/view/complete_trip/widget/payment_price_widget.dart';
import 'package:tanfeth_apps/travel/taxi24/taxi24_passenger/presentation/view/find_driver/vm/searching_vm.dart';
import 'package:tanfeth_apps/travel/taxi24/taxi24_passenger/presentation/view/find_driver/widget/driver_info_widget.dart';
import 'package:tanfeth_apps/travel/taxi24/taxi24_passenger/presentation/view/find_driver/widget/searching_driver_widget.dart';
import 'package:tanfeth_apps/travel/taxi24/taxi24_passenger/presentation/view/find_driver/widget/trip_details_widget.dart';
import 'package:tanfeth_apps/travel/taxi24/taxi24_passenger/presentation/view/home/vm/toggle_animation_vm.dart';
import 'package:tanfeth_apps/travel/taxi24/taxi24_passenger/shared/helper_methods.dart';
import 'package:showcaseview/showcaseview.dart';
import 'package:tanfeth_apps/travel/taxi24/taxi24_passenger/shared/show_case.dart';
import 'package:tanfeth_apps/travel/taxi24/taxi24_passenger/shared/storage.dart';


class FindDriverView extends ConsumerStatefulWidget{
  const FindDriverView({
    super.key,
});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _FindDriverView();

}

class _FindDriverView extends ConsumerState<FindDriverView>{

  ScrollController controller = ScrollController();

  @override
  void initState() {
    scrollToTop();
    super.initState();
  }



  @override
  Widget build(BuildContext context) {
    return Container(
      height: 400,
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
      decoration: BoxDecoration(
          color: context.color.surface,
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(30),
            topRight: Radius.circular(30),
          )),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          Expanded(
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              controller: controller,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  10.ph,
                  if(  ref.watch(searchingProvider) == 0)...[
                    const SearchingDriverWidget(),
                  ]else...[
                    const DriverInfoWidget(),
                  ],

                  30.ph,
                  Text(
                    LangEnum.tripDetails.tr(),
                    style: context.text.bodyLarge,
                  ),

                  const Padding(
                    padding: EdgeInsets.symmetric(vertical:10),
                    child: TripDetailsWidget(),
                  ),

                  20.ph,

                  Text(
                    LangEnum.paymentMethod.tr(),
                    style: context.text.bodyLarge,
                  ),

                  10.ph,

                  Row(
                    children: [
                      Image.asset(
                        getPaymentImage(ref:ref),
                        width: 23,
                        height: 23,
                      ),
                      20.pw,

                      Expanded(
                        child: Text(
                          getPaymentName(ref:ref),
                          style: context.text.bodyLarge,
                        ),
                      ),

                    ],
                  ),

                  Showcase(
                      key: showcaseKey7,
                      description: LangEnum.paymentPriceCaseHint.tr(),
                      child: const PaymentPriceWidget()),

                  20.ph,
                ],
              ),
            ),
          ),

          Center(
            child: GestureDetector(
                onTap: () async {
                  showBottomSheetFunction(
                    content: Container(
                      width: double.infinity,
                      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                        decoration: BoxDecoration(
                            color: context.color.surface,
                            borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(30),
                              topRight: Radius.circular(30),
                            )),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [

                          const Center(child: CloseBottomSheetWidget()),
                          10.ph,

                          Text(
                            LangEnum.areSureWantCancel.tr(),
                            style: context.text.titleMedium,
                          ),

                          20.ph,

                          Text(
                              LangEnum.chargedCancelling.tr(),
                          ),

                          20.ph,

                          ElevatedButton(
                            onPressed: () async {
                              Get.back();
                              ref.read(toggleAnimationProvider.notifier)
                              .toggleTripFooterAnimate(true);
                            },
                            style: ButtonStyle(
                              backgroundColor: WidgetStateProperty.all<Color?>(context.color.error),
                            ),
                            child: Text(LangEnum.cancelRide.tr()),
                          ),

                          20.ph,

                          InkWell(
                            onTap: ()=> Get.back(),
                            child: Center(
                              child: Text(
                                LangEnum.noKeepRide.tr(),
                                style: context.text.bodyLarge,
                              ),
                            ),
                          ),
                          20.ph,
                        ],
                      ),
                    ),
                  );

                },
                child: Showcase(
                  key: showcaseKey8,
                  description: LangEnum.cancelRideCaseHint.tr(),
                  onBarrierClick: (){
                    TaxiPassengerAppStorage.showHomeFindDriverCase(false);
                  },
                  child: Text(
                    LangEnum.cancelRide.tr(),
                    style: context.text.bodyLarge?.copyWith(
                        color: context.color.error
                    ),
                  ),
                )
            ),
          ),

          const SizedBox(height: 15,),
        ],
      ),
    );
  }


  scrollToTop() {
    Timer(
     const Duration(seconds: 0),
          () => controller.animateTo(0.0, curve: Curves.easeOut, duration: const Duration(milliseconds: 300)),
    );
  }


}