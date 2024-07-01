
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/get.dart';
import 'package:tanfeth_apps/common/presentation/widget/appbar.dart';
import 'package:tanfeth_apps/common/presentation/widget/divider.dart';
import 'package:tanfeth_apps/common/shared/extensions/padding_extension.dart';
import 'package:tanfeth_apps/common/shared/extensions/theme_extensions.dart';
import 'package:tanfeth_apps/common/shared/languages.dart';
import 'package:tanfeth_apps/common/shared/web_width.dart';
import 'package:tanfeth_apps/travel/common/presentation/widget/back_button_widget.dart';
import 'package:tanfeth_apps/travel/taxi24/taxi24_passenger/data/model/CarTypeModel.dart';
import 'package:tanfeth_apps/travel/taxi24/taxi24_passenger/presentation/view/choose_ride/vm/car_type_vm.dart';
import 'package:tanfeth_apps/travel/taxi24/taxi24_passenger/presentation/view/complete_trip/widget/car_type_cell.dart';
import 'package:tanfeth_apps/travel/taxi24/taxi24_passenger/presentation/view/complete_trip/widget/coupon_widget.dart';
import 'package:tanfeth_apps/travel/taxi24/taxi24_passenger/presentation/view/complete_trip/widget/payment_methods_widget.dart';
import 'package:tanfeth_apps/travel/taxi24/taxi24_passenger/presentation/view/complete_trip/widget/payment_price_widget.dart';


class CompleteTripView extends ConsumerStatefulWidget{
  const CompleteTripView();

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _CompleteTripView();


}

class _CompleteTripView extends ConsumerState<CompleteTripView>{


  List<CarTypeModel> carTypeList = [];

  late CarTypeVM carTypeVM;
  late int currentIndex ;
  final TextEditingController controller = TextEditingController();
  String promoCode = '';


  @override
  void initState() {
    for(int i =0; i< 3 ; i ++){
      CarTypeModel carTypeModel = CarTypeModel();
      carTypeModel.carType= "Sedan";
      carTypeModel.carImage ='https://picsum.photos/200/300';
      carTypeModel.passengersNumber= 4;
      carTypeModel.tripCost= 44;
      carTypeList.add(carTypeModel);
    }

    super.initState();
  }


  initBuild(){
    carTypeVM = ref.watch(carTypeProvider.notifier);
    currentIndex = ref.watch(carTypeProvider);
  }




  @override
  Widget build(BuildContext context) {
    initBuild();

    return Scaffold(
      appBar: MainAppBar(
        title: LangEnum.completeTrip.tr(),
        leadingWidget: const BackButtonWidget(),
      ),
      body: WebWidth(
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 24),
            child: Column(
              children: [
                Expanded(
                  child: SingleChildScrollView(
                    physics: const BouncingScrollPhysics(),
                    child: Column(
                      children: [
                        ...List.generate(carTypeList.length, (index) =>
                            InkWell(
                              onTap: () {
                                carTypeVM.changeIndex(index);
                              },
                              child: Container(
                                  decoration: currentIndex == index ?
                                  BoxDecoration(
                                      border: Border.all(
                                          color: context.color.primary, width: 2),
                                      color: context.color.primary.withOpacity(0.2),
                                      borderRadius:
                                      BorderRadius.circular(8)): null,
                                  child: CarTypeCell(carTypeModel: carTypeList[index],)),
                            )),
                        25.ph,
                        const LargeDivider(),
                        25.ph,
                        const PaymentMethodsWidget(),
                        15.ph,
                        const CouponWidget(),
                        const PaymentPriceWidget(),
                        25.ph,

                      ],
                    )


                  ),
                ),

                ElevatedButton(
                  onPressed: () async {
                   // Get.offNamed(AddRiderRouting.config().path);
                  },
                  child: Text(LangEnum.confirm.tr()),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

}