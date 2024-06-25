
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';



class ChooseRideSlideWidget extends ConsumerStatefulWidget{
  const ChooseRideSlideWidget();

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>_ChooseRideSlideWidget();

}

class _ChooseRideSlideWidget extends ConsumerState<ChooseRideSlideWidget>{
  @override
  Widget build(BuildContext context) {
    return  CustomSlidePanel(
      minHeight: 420,
      maxHeight: 420,
      locationDetectorEnabled: false,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24, vertical: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomText(
              text: "Choose a ride".tr(),
              fontSize: FontSizer.s24,
              fontWeight: FontWeightManager.large,
            ),
            SizedBox(height: 24,),
            Expanded(
              child: Column(
                children: [
                  Expanded(
                      child: ListView(
                        padding: EdgeInsets.zero ,
                        physics: const NeverScrollableScrollPhysics(),
                        children: [
                          GestureDetector(
                            behavior: HitTestBehavior.translucent,
                            onTap: () => changeCurrentTrip(index: 0),
                            child: Container(
                              decoration: currentIndex == 0 ? tripDecoration : null,
                              child: TripInformationWidget(
                                carType: "Sedan".tr(),
                                arriveTime: "3 - 5 ${"min".tr()}",
                                passengersNumber: 4,
                                tripCost: tripPriceEntity?.sedanCarPrice??0.0,
                              ),
                            ),
                          ),
                          GestureDetector(
                            behavior: HitTestBehavior.translucent,
                            onTap: () => changeCurrentTrip(index: 1),
                            child: Container(
                              decoration: currentIndex != 0 ? tripDecoration : null,
                              child: TripInformationWidget(
                                carType: "Family".tr(),
                                arriveTime: "3 - 5 ${"min".tr()}",
                                passengersNumber: 7,
                                tripCost: tripPriceEntity?.familyCarPrice??0.0,
                              ),
                            ),
                          ),
                        ],) ),
                  const Divider(
                    color: ColorsManager.dividerColor,
                  ),
                  Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: 12.0),
                        child: Row(
                          children: [
                            Expanded(
                              child: GestureDetector(

                                  onTap: (){
                                    showCustomBottomSheetMenu(context: context, child: const PaymentMethodWidget());
                                  },
                                  child:  PaymentTypeWidget(
                                      typeTitle: selectPayment==0?"Cash".tr() : getIt<CardViewModel>().cardList[selectPayment-1].cardBrand??"",
                                      typeColor: selectPayment==0?ColorsManager.greenColor:null,
                                      typeImage: selectPayment==0?AssetsManager.cashSVG:getIt<CardViewModel>().cardList[selectPayment-1].cardBrand?.toLowerCase()=="master".tr()? AssetsManager.mastercardSVG:AssetsManager.visaSVG)
                              ),
                            ),
                            SizedBox(
                              width: 24.w,
                            ),
                            Expanded(
                              child: GestureDetector(
                                onTap: (){
                                  showCustomBottomSheetMenu(
                                      isScrollControlled: true,
                                      context: context,
                                      child: PromoCodeScreen(start: widget.start, destination: widget.destination));
                                },
                                child:  PaymentTypeWidget(
                                    typeTitle: "Add Promo".tr(),
                                    typeColor: ColorsManager.baseOrange,
                                    typeImage: AssetsManager.percentageSVG),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding:  EdgeInsets.symmetric(vertical: 8),
                        child: PrimaryButton(
                          isLoading: state is AddTripsLoadingState ? true :false,
                          text: "Confirm".tr(),
                          onPressed: () async {
                            await addTrip(parameter: {
                              "Price": currentIndex==0?tripPriceEntity?.sedanCarPrice:tripPriceEntity?.familyCarPrice,
                              "orderTempId":tripPriceEntity?.orderTempId,
                              "PaymentMethods": <int>[
                                paymentType(selectPayment: selectPayment, openWallet: openWallet),
                              ],
                              "CarSeatType": currentIndex+1,
                              "points": [
                                {
                                  "index": 0,
                                  "Lat": widget.start["startLatLng"].latitude,
                                  "lng": widget.start["startLatLng"].longitude,
                                  "placeId": widget.start['startLocation'].placeId,
                                  "Description":  widget.start['startLocation'].description,
                                  "SecondaryText":  widget.start['startLocation'].locationCity
                                },
                                {
                                  "index": 1,
                                  "Lat": widget.destination['destinationLatLng'].latitude,
                                  "lng": widget.destination['destinationLatLng'].longitude,
                                  "placeId": widget.destination['destinationLocation'].placeId,
                                  "Description": widget.destination['destinationLocation'].description,
                                  "SecondaryText": widget.destination['destinationLocation'].locationCity
                                }
                              ],
                              "PromoCode": null,
                              "CardId":selectPayment!=0? getIt<CardViewModel>().cardList[selectPayment-1].id:null
                            }).then((value) {
                              if(tripEntity!.tripId.isNotEmpty){
                                Navigator.pushNamedAndRemoveUntil(context, RoutePath.tripStageScreen,(_)=>false,arguments: {'tripId' : tripEntity?.tripId});
                              }
                              else{
                                Navigator.pushNamed(context, RoutePath.payTripWebViewScreen);
                              }
                            });
                          },
                          color: ColorsManager.baseOrange,
                          colorText: ColorsManager.blackColor,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

}