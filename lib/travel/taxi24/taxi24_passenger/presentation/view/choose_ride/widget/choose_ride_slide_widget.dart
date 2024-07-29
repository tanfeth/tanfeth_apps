
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/get.dart';
import 'package:api_controller/shared/extensions/padding_extension.dart';
import 'package:api_controller/shared/extensions/theme_extensions.dart';
import 'package:tanfeth_apps/common/shared/images.dart';
import 'package:tanfeth_apps/common/shared/languages.dart';
import 'package:tanfeth_apps/travel/common/presentation/widget/custom_slide_panel.dart';
import 'package:tanfeth_apps/travel/common/shared/routes/payment_method_route.dart';
import 'package:tanfeth_apps/travel/common/shared/routes/promo_code_route.dart';
import 'package:tanfeth_apps/travel/taxi24/taxi24_driver/presentation/widget/small_divider.dart';
import 'package:tanfeth_apps/travel/taxi24/taxi24_passenger/data/model/CarTypeModel.dart';
import 'package:tanfeth_apps/travel/taxi24/taxi24_passenger/presentation/view/choose_ride/vm/car_type_vm.dart';
import 'package:tanfeth_apps/travel/taxi24/taxi24_passenger/presentation/view/complete_trip/widget/car_type_cell.dart';
import 'package:tanfeth_apps/travel/taxi24/taxi24_passenger/presentation/view/choose_ride/widget/payment_type_widget.dart';



class ChooseRideSlideWidget extends ConsumerStatefulWidget{
  const ChooseRideSlideWidget();

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>_ChooseRideSlideWidget();

}

class _ChooseRideSlideWidget extends ConsumerState<ChooseRideSlideWidget>{


  CarTypeModel carTypeModel = CarTypeModel();
  late CarTypeVM carTypeVM;
  int currentIndex  = 0;
  final TextEditingController controller = TextEditingController();
  String promoCode = '';

  @override
  void initState() {
    carTypeModel.carType= "Sedan";
    carTypeModel.carImage ='https://picsum.photos/200/300';
    carTypeModel.passengersNumber= 4;
    carTypeModel.tripCost= 44;
    super.initState();
  }


  initBuild(){
    carTypeVM = ref.watch(carTypeProvider.notifier);
    currentIndex = ref.watch(carTypeProvider);
  }
  
  
  @override
  Widget build(BuildContext context) {
    initBuild();
    
    return  CustomSlidePanel(
      maxHeight: 420,
      locationDetectorEnabled: false,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24, vertical: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            Text(
              LangEnum.chooseRide.tr(),
              style: context.text.titleMedium,
            ),

            SizedBox(height: 24,),
            Expanded(
              child: Column(
                children: [
                  Expanded(
                      child: ListView(
                        padding: EdgeInsets.zero ,
                        physics: const BouncingScrollPhysics(),
                        children: [
                          GestureDetector(
                            behavior: HitTestBehavior.translucent,
                            onTap: () {},
                            child: Container(
                              decoration: currentIndex == 0 ?
                              BoxDecoration(
                                  border: Border.all(
                                      color: context.color.primary, width: 2),
                                  color: context.color.primary.withOpacity(0.2),
                                  borderRadius:
                                  BorderRadius.circular(8)): null,
                              child: CarTypeCell(
                                carTypeModel: carTypeModel,
                              ),
                            ),
                          ),
                        ],) ),

                  const SmallDivider(),


                  Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: 12.0),
                        child: Row(
                          children: [
                            Expanded(
                              child: GestureDetector(

                                  onTap: (){
                                    Get.toNamed(PaymentMethodRouting.config().path);
                                  },
                                  child:  PaymentTypeWidget(
                                      title:LangEnum.cash.tr(),
                                      image: Images.cashSVG,
                                      // AssetsManager.mastercardSVG:
                                      // AssetsManager.visaSVG
                                  )
                              ),
                            ),
                            SizedBox(
                              width: 24,
                            ),
                            Expanded(
                              child: GestureDetector(
                                onTap: ()async{
                                  promoCode = await Get.toNamed(
                                      PromoCodeRouting.config().path);
                                  setState(() {});

                                },
                                child:  PaymentTypeWidget(
                                    title: promoCode.isEmpty?
                                    LangEnum.addPromo.tr():promoCode,
                                    color: context.color.primary,
                                    image: Images.percentageSVG),
                              ),
                            ),
                          ],
                        ),
                      ),

                      8.ph,

                      Padding(
                        padding:  EdgeInsets.symmetric(vertical: 8),
                        child:ElevatedButton(
                          onPressed: () {},
                          child: Text(LangEnum.confirm.tr()),
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