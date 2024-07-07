
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tanfeth_apps/common/shared/extensions/theme_extensions.dart';
import 'package:tanfeth_apps/common/shared/images.dart';
import 'package:tanfeth_apps/common/shared/languages.dart';
import 'package:tanfeth_apps/travel/taxi24/taxi24_passenger/data/model/CarTypeModel.dart';
import 'package:tanfeth_apps/travel/taxi24/taxi24_passenger/presentation/view/choose_ride/vm/car_list_vm.dart';
import 'package:tanfeth_apps/travel/taxi24/taxi24_passenger/presentation/view/choose_ride/vm/car_type_vm.dart';
import 'package:tanfeth_apps/travel/taxi24/taxi24_passenger/presentation/view/complete_trip/widget/car_type_cell.dart';




class FooterCarList extends ConsumerStatefulWidget {
  const FooterCarList({super.key});

  @override
  ConsumerState<FooterCarList> createState() => _FooterCarListState();
}

class _FooterCarListState extends ConsumerState<FooterCarList> {

late CarListVM carListVM;
  late List<CarTypeModel> carList ;

  late CarTypeVM carTypeVM;
  late int currentIndex ;


  @override
  void initState() {
    carListVM = ref.read(carListProvider.notifier);
    carList =ref.read(carListProvider);
    for(int i =0; i< 2 ; i ++){
      if(i == 0){
        CarTypeModel carTypeModel = CarTypeModel();
        carTypeModel.carType= LangEnum.sedan.tr();
        carTypeModel.carImage =Images.sedan;
        carTypeModel.passengersNumber= 4;
        carTypeModel.tripCost= 44;
        WidgetsBinding.instance.addPostFrameCallback((_) async {
          carListVM.addToList([carTypeModel]);
        });

      }else {
        CarTypeModel carTypeModel = CarTypeModel();
        carTypeModel.carType= LangEnum.familyCar.tr();
        carTypeModel.carImage =Images.familyCar;
        carTypeModel.passengersNumber= 7;
        carTypeModel.tripCost= 44;
        WidgetsBinding.instance.addPostFrameCallback((_) async {
          carListVM.addToList([carTypeModel]);
        });

      }
    }

    super.initState();
  }



  initBuild(){
    carTypeVM = ref.watch(carTypeProvider.notifier);
    currentIndex = ref.watch(carTypeProvider);
    carListVM = ref.watch(carListProvider.notifier);
    carList =ref.watch(carListProvider);
  }



  @override
  Widget build(BuildContext context) {
    initBuild();

    return  SizedBox(
        height: 120,
        child:ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: carList.length,
          itemBuilder: (context,index){
            return   InkWell(
              onTap: () {
                carTypeVM.changeIndex(index);
              },
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10,
                    vertical: 15),
                child: Container(
                    width: 100,
                    margin: EdgeInsets.symmetric(horizontal: 20),
                    decoration: currentIndex == index ?
                    BoxDecoration(
                        border: Border.all(
                            color: context.color.primary, width: 2),
                        color: context.color.primary.withOpacity(0.2),
                        borderRadius:
                        BorderRadius.circular(8)): null,
                    child: Center(child: CarTypeCell(carTypeModel: carList[index],))),
              ),
            );
          },
        )

    );
  }
}
