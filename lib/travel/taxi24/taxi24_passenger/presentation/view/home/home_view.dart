import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:line_icons/line_icons.dart';
import 'package:tanfeth_apps/common/presentation/widget/text_form_field_widget.dart';
import 'package:tanfeth_apps/common/shared/extensions/theme_extensions.dart';
import 'package:tanfeth_apps/common/shared/helper_methods.dart';
import 'package:tanfeth_apps/common/shared/images.dart';
import 'package:tanfeth_apps/common/shared/languages.dart';
import 'package:tanfeth_apps/travel/common/data/model/ParamMapModel.dart';
import 'package:tanfeth_apps/travel/common/presentation/widget/custom_slide_panel.dart';
import 'package:tanfeth_apps/travel/common/presentation/widget/map_widget.dart';
import 'package:tanfeth_apps/travel/common/shared/form_validation.dart';
import 'package:tanfeth_apps/travel/common/vm/map_vm.dart';
import 'package:tanfeth_apps/travel/taxi24/taxi24_driver/presentation/view/home/current_location/current_location_fab.dart';
import 'package:tanfeth_apps/travel/taxi24/taxi24_passenger/presentation/view/home/widget/where_action_button.dart';
import 'package:tanfeth_apps/travel/taxi24/taxi24_passenger/presentation/view/home/widget/where_widget.dart';


class TaxiPassengerHomeView extends ConsumerStatefulWidget{
  const TaxiPassengerHomeView();
  
  @override
  ConsumerState<ConsumerStatefulWidget> createState()=> _PassengerHomeView();
  
}

class _PassengerHomeView extends ConsumerState<TaxiPassengerHomeView>{




  @override
  void initState() {

    super.initState();
  }




  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
       closeKeyBoard();
      },
      child: Stack(
        alignment: AlignmentDirectional.topCenter,
        children: [

          MapWidget(),



          // Padding(padding:EdgeInsets.symmetric(horizontal: 12 ,vertical: 70),
          //   child:Column(
          //     children: [
          //       if(!isLocationEnabledStatus)
          //         BlocBuilder<AlertLocationStatusViewModel,AlertLocationStates>(
          //             builder: (context,state) {
          //               return AlertLocationStatusWidget(bodyText: 'Please turn on location servicese need to know your location so we can find trips for you.'.tr(),
          //                   isVisible: !isLocationEnabledStatus,
          //                   function:() async {
          //                     await alertViewModel.requestEnable(context);
          //                   });
          //             }
          //         ),
          //       if(!locationPermission)
          //         BlocBuilder<AlertLocationStatusViewModel,AlertLocationStates>(
          //             builder: (context,state) {
          //               return AlertLocationStatusWidget(
          //                 bodyText: 'Please Enable location , to use Taxi24'.tr(),
          //                 isVisible: !locationPermission,
          //                 function:() async => await alertViewModel.requestPermission(),);
          //             }
          //         ),
          //     ],
          //   ),
          // ),
        ],
      ),
    );
  }


  
}