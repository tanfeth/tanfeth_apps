import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/get.dart';
import 'package:tanfeth_apps/common/presentation/widget/bottom_sheet/close_bottom_sheet_widget.dart';
import 'package:tanfeth_apps/common/presentation/widget/bottom_sheet/show_bottom_sheet.dart';
import 'package:tanfeth_apps/common/shared/extensions/button_extensions.dart';
import 'package:tanfeth_apps/common/shared/extensions/padding_extension.dart';
import 'package:tanfeth_apps/common/shared/extensions/theme_extensions.dart';
import 'package:tanfeth_apps/common/shared/helper_methods.dart';
import 'package:tanfeth_apps/common/shared/languages.dart';
import 'package:tanfeth_apps/common/shared/storage.dart';
import 'package:tanfeth_apps/travel/taxi24/taxi24_passenger/presentation/view/complete_trip/widget/payment_price_widget.dart';
import 'package:tanfeth_apps/travel/taxi24/taxi24_passenger/presentation/view/find_driver/vm/find_driver_vm.dart';
import 'package:tanfeth_apps/travel/taxi24/taxi24_passenger/presentation/view/find_driver/widget/driver_info_widget.dart';
import 'package:tanfeth_apps/travel/taxi24/taxi24_passenger/presentation/view/find_driver/widget/searching_driver_widget.dart';
import 'package:tanfeth_apps/travel/taxi24/taxi24_passenger/presentation/view/find_driver/widget/trip_details_widget.dart';
import 'package:tanfeth_apps/travel/taxi24/taxi24_passenger/presentation/view/home/vm/toggle_animation_vm.dart';
import 'package:tanfeth_apps/travel/taxi24/taxi24_passenger/shared/helper_methods.dart';
import 'package:showcaseview/showcaseview.dart';


class FindDriverView extends ConsumerStatefulWidget{
  final List<GlobalKey>? showcaseList;
  const FindDriverView({
    super.key,
    this.showcaseList = const []
});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _FindDriverView();

}

class _FindDriverView extends ConsumerState<FindDriverView>{


  @override
  void initState() {
    if(AppStorage.getHomeCase() == true){
      showCaseEvent(context: context,caseList: widget.showcaseList??[]);
    }

    super.initState();
  }



  @override
  Widget build(BuildContext context) {
    return Container(
      height: 400,
      padding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
      decoration: BoxDecoration(
          color: context.color.surface,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30),
            topRight: Radius.circular(30),
          )),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          Expanded(
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  10.ph,
                  if(  ref.watch(findDriverProvider) == 0)...[
                    SearchingDriverWidget(),
                  ]else...[
                    DriverInfoWidget(),
                  ],

                  30.ph,
                  Text(
                    LangEnum.tripDetails.tr(),
                    style: context.text.bodyLarge,
                  ),

                  Padding(
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
                      key: widget.showcaseList??[][5],
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
                      padding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                        decoration: BoxDecoration(
                            color: context.color.surface,
                            borderRadius: BorderRadius.only(
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



                  // showCustomBottomSheetMenu(
                  //   context: context,
                  //   height: 250,
                  //   child: Column(
                  //     crossAxisAlignment: CrossAxisAlignment.start,
                  //     children: [
                  //       CustomText(
                  //         text: "Are your sure you want to cancel?".tr(),
                  //         maxLines: 3,
                  //         fontSize: 24,
                  //         fontWeight: FontWeightManager.bold,
                  //       ),
                  //       SizedBox(height: 8,),
                  //       CustomText(
                  //         text: "Your driver is on the way.".tr(),
                  //         fontSize: 18,
                  //         fontWeight: FontWeightManageregular,
                  //         fontColor: ColorsManager.greyColor,
                  //       ),
                  //       SizedBox(
                  //         height: 32,
                  //       ),
                  //       PrimaryButton(
                  //         width: 327.w,
                  //         height: 56,
                  //         color: ColorsManageredColorD03E3E,
                  //         colorText: ColorsManager.whiteColor,
                  //         text: "Cancel ride".tr(),
                  //         onPressed: () {
                  //           Navigator.pop(context);
                  //           showCustomBottomSheetMenu(
                  //             context: context,
                  //             height: 530,
                  //             isScrollControlled: true,
                  //             child: Column(
                  //               crossAxisAlignment: CrossAxisAlignment.start,
                  //               children: [
                  //                 CustomText(
                  //                   text: "Why do you want to cancel?".tr(),
                  //                   maxLines: 3,
                  //                   fontSize: 24,
                  //                   fontWeight: FontWeightManager.bold,
                  //                 ),
                  //                 SizedBox(height: 42,),
                  //                 Expanded(
                  //                   child: BlocBuilder<TripStatusViewModel,TripStatusStates>(
                  //                       builder: (context,state) {
                  //                         return ListView.separated(
                  //                           physics: const NeverScrollableScrollPhysics(),
                  //                           itemCount:cancelReason.length ,
                  //                           itemBuilder:(context,index){
                  //                             return GestureDetector(
                  //                               onTap:(){
                  //                                 reasonIndex=changeIndex(index);
                  //                               },
                  //                               child: Row(
                  //                                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  //                                 children: [
                  //                                   CustomText(
                  //                                     text: cancelReason[index].tr(),
                  //                                     fontSize: 16,
                  //                                     fontWeight: FontWeightManager.medium,
                  //                                   ),
                  //                                   Container(
                  //                                     height: 20,
                  //                                     width: 20,
                  //                                     alignment: Alignment.center,
                  //                                     decoration: index!=reasonIndex ?
                  //                                     BoxDecoration(
                  //                                         borderRadius: BorderRadius.circular(16),
                  //                                         border: Border.all(color: ColorsManager.dividerColor,width: 2.w)
                  //                                     ):BoxDecoration(
                  //                                         color: ColorsManager.blackColor,
                  //                                         borderRadius: BorderRadius.circular(16),
                  //                                         border: Border.all(color: ColorsManager.baseOrange,width: 6)
                  //                                     ),)
                  //                                 ],
                  //                               ),
                  //                             );
                  //                           } ,
                  //                           separatorBuilder: (context,index){
                  //                             return SizedBox(height: 30,);
                  //                           },
                  //                         );
                  //                       }
                  //                   ),
                  //                 ),
                  //                 BlocConsumer<TripStatusViewModel,TripStatusStates>(
                  //                     listener:(context,state){
                  //                       if(state is CancelTripSuccessState){
                  //                         Navigator.pushNamedAndRemoveUntil(context, RoutePath.bottomNavLayout, (route) => false);
                  //                       }else if(state is CancelTripErrorState){
                  //                         Navigator.pop(context);
                  //                       }
                  //                     },
                  //                     builder: (context,state) {
                  //                       return PrimaryButton(
                  //                         width: 327.w,
                  //                         height: 56,
                  //                         isDisable:reasonIndex==-1 ? true : false,
                  //                         color: ColorsManager.baseOrange,
                  //                         text: "Cancel ride".tr(),
                  //                         isLoading: state is CancelTripLoadingState ? true : false,
                  //                         colorText: ColorsManager.whiteColor,
                  //                         onPressed: () {
                  //                           cancelTrip(parameter:{
                  //                             "orderId":tripFireBaseEntity!.id,
                  //                             "Reason":cancelReason[reasonIndex]
                  //                           });
                  //                         },
                  //                       );
                  //                     }
                  //                 ),
                  //                 SizedBox(height: 16,),
                  //               ],
                  //             ),
                  //           );
                  //         },
                  //       ),
                  //       SizedBox(height: 34,),
                  //       Center(
                  //         child: GestureDetector(
                  //           onTap: () {
                  //             Navigator.pop(context);
                  //           },
                  //           child: Center(
                  //             child: CustomText(
                  //               text: "No keep ride".tr(),
                  //               fontSize: 18,
                  //               fontWeight: FontWeightManager.large,
                  //             ),
                  //           ),
                  //         ),
                  //       ),
                  //     ],
                  //   ),
                  // );
                },
                child: Text(
                  LangEnum.cancelRide.tr(),
                  style: context.text.bodyLarge?.copyWith(
                      color: context.color.error
                  ),
                )
            ),
          ),

          SizedBox(height: 15,),
        ],
      ),
    );
  }

}