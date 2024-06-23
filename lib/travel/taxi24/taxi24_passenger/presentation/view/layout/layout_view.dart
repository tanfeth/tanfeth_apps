

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/get.dart';
import 'package:tanfeth_apps/common/shared/extensions/system_ui_overlay_extension.dart';
import 'package:tanfeth_apps/common/shared/routing/routes/home_route.dart';
import 'package:tanfeth_apps/common/shared/routing/routes/layout_route.dart';
import 'package:tanfeth_apps/travel/common/vm/map_vm.dart';
import 'package:tanfeth_apps/travel/taxi24/taxi24_driver/presentation/view/home/current_location/current_location_fab.dart';
import 'package:tanfeth_apps/travel/taxi24/taxi24_passenger/presentation/view/home/widget/where_action_button.dart';

import 'package:tanfeth_apps/common/shared/routing/routes/profile_routing.dart';
import 'package:tanfeth_apps/travel/taxi24/taxi24_passenger/presentation/view/layout/vm/layout_vm.dart';
import 'package:tanfeth_apps/travel/taxi24/taxi24_passenger/presentation/view/layout/widget/layout_nav_bar.dart';


class TaxiPassengerLayoutView extends ConsumerStatefulWidget{
  const TaxiPassengerLayoutView({Key? key}) : super(key: key);

  @override
  ConsumerState<TaxiPassengerLayoutView> createState() => _LayoutViewState();
}

class _LayoutViewState extends ConsumerState<TaxiPassengerLayoutView>{

  late String index;
  late LayoutVM layoutVM ;
  late MapVM mapVM;




  final navScreens = <Widget>[
     HomeRouting.config().widget,
    Scaffold(
      body: Container(
        color: Colors.black,
      ),
    ),
    ProfileRouting.config().widget

  ];


  @override
  void initState() {
    index = Get.parameters[LayoutRouting.index] ?? '';
    mapVM = ref.read(mapProvider.notifier);
    layoutVM = ref.read(layoutProvider.notifier);
    layoutVM.changeCurrentIndex(index.isEmpty ? 0 : int.parse(index)) ;
    super.initState();
  }






  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      floatingActionButton:  ref.watch(layoutProvider) ==0?
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          WhereActionButton(),
          CurrentLocationDetector(onTap:()async{
            mapVM.getCurrentLocation();
          }),
         
        ],
      ):const SizedBox.shrink(),
      body: navScreens.elementAt(ref.watch(layoutProvider)),
      bottomNavigationBar:  TaxiPassengerLayoutBottomNavigationBar(
        layoutVM: layoutVM,
      ),
    ).systemUiDarkText(context);

  }


}