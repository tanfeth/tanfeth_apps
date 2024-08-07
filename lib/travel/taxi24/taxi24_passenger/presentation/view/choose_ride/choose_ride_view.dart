import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:tanfeth_apps/common/presentation/widget/appbar.dart';
import 'package:tanfeth_apps/common/shared/languages.dart';
import 'package:api_controller/shared/web_width.dart';
import 'package:tanfeth_apps/travel/common/presentation/widget/back_button_widget.dart';
import 'package:tanfeth_apps/travel/common/shared/routes/choose_ride_route.dart';
import 'package:tanfeth_apps/travel/taxi24/taxi24_passenger/presentation/view/choose_ride/widget/choose_ride_map_widget.dart';
import 'package:tanfeth_apps/travel/taxi24/taxi24_passenger/presentation/view/choose_ride/widget/choose_ride_slide_widget.dart';
import 'package:tanfeth_apps/travel/taxi24/taxi24_passenger/presentation/view/destination/vm/destination_list_vm.dart';


class ChooseRideView extends ConsumerStatefulWidget{
  const ChooseRideView();

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _ChooseRideView();
  

}

class _ChooseRideView extends ConsumerState<ChooseRideView>{

  late LatLng pickUpLatLng;


  @override
  void initState() {
    if(Get.arguments != null){
      pickUpLatLng = Get.arguments[ChooseRideRouting.pickUpLatLng];
    }

    super.initState();
  }


  @override
  Widget build(BuildContext context) {


    return Scaffold(
      appBar: MainAppBar(
        title: LangEnum.chooseRide.tr(),
        leadingWidget: const BackButtonWidget(),
      ),
      body: WebWidth(
        child: SafeArea(
          child: Stack(
            children: [
              ChooseRideMapWidget(),

              ChooseRideSlideWidget(),
            ],
          )
        ),
      ),
    );
  }
  
}