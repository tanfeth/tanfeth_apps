
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tanfeth_apps/travel/common/vm/map_vm.dart';
import 'package:tanfeth_apps/travel/taxi24/taxi24_driver/presentation/view/home/current_location/current_location_fab.dart';
import 'package:tanfeth_apps/travel/taxi24/taxi24_passenger/presentation/view/home/widget/where_action_button.dart';
import 'package:tanfeth_apps/travel/taxi24/taxi24_passenger/presentation/view/layout/vm/layout_vm.dart';

class TaxiPassengerFloatWidget extends ConsumerStatefulWidget{
  const TaxiPassengerFloatWidget({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState()=>_TaxiPassengerFloatWidget();


}

class _TaxiPassengerFloatWidget extends ConsumerState<TaxiPassengerFloatWidget>{
  @override
  Widget build(BuildContext context) {
    return ref.watch(layoutProvider) ==1?
    Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
         WhereActionButton(),
        CurrentLocationDetector(onTap:()async{
          ref.read(mapProvider.notifier).getCurrentLocation();
        }),

      ],
    ):const SizedBox.shrink();
  }

}