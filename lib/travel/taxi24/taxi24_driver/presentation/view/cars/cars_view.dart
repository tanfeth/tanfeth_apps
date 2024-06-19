
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/get.dart';
import 'package:tanfeth_apps/common/presentation/widget/appbar.dart';
import 'package:tanfeth_apps/common/shared/languages.dart';
import 'package:tanfeth_apps/common/shared/web_width.dart';
import 'package:tanfeth_apps/travel/common/shared/routes/add_car_route.dart';
import 'package:tanfeth_apps/travel/taxi24/taxi24_driver/data/model/CarModel.dart';
import 'package:tanfeth_apps/travel/common/presentation/widget/back_button_widget.dart';
import 'package:tanfeth_apps/travel/taxi24/taxi24_driver/presentation/view/cars/widget/car_cell.dart';
import 'package:tanfeth_apps/travel/taxi24/taxi24_driver/presentation/widget/small_divider.dart';

class TaxiDriverCarsView extends ConsumerStatefulWidget{
  const TaxiDriverCarsView();

  @override
  ConsumerState<ConsumerStatefulWidget> createState()=> _CarsView();

}

class _CarsView extends ConsumerState<TaxiDriverCarsView>{

  CarModel carModel = CarModel();


  List<CarModel> carList = [];

  @override
  void initState() {
    carModel.isDefault = false;
    carModel.carType ="تويوتا";
    carModel.carModel ="كورولا";
    carModel.carYear =2018;
    carModel.plateNo ="1234";
    carModel.plateLetterLeft ="A";
    carModel.plateLetterMiddle ="B";
    carModel.plateLetterRight ="C";
    carModel.carColor ="أسود";
    for(int i = 0 ; i < 3 ; i++){
      carList.add(carModel);
    }

    super.initState();
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MainAppBar(
        title: LangEnum.myCars.tr(),
        leadingWidget: BackButtonWidget(),
      ),
      body: WebWidth(
        child: SafeArea(
          child:  Padding(
            padding: EdgeInsets.symmetric(horizontal: 24,
            vertical: 16),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [

                Expanded(
                  child: ListView.separated(
                    itemBuilder: (BuildContext context, int index) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8),
                        child: CarCell(carModel: carList[index]),
                      );
                    },
                    separatorBuilder: (BuildContext context, int index) {
                      return const SmallDivider();
                    },
                    itemCount: carList.length,
                  ),
                ),



                ElevatedButton(
                  onPressed: () async {
                    Get.toNamed(AddCarRouting.config().path);
                  },
                  child: Text(LangEnum.addCar.tr()),
                ),
              ],
            )
          ),
        ),
      ),
    );
  }

}