import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:tanfeth_apps/travel/common/data/model/ParamMapModel.dart';
import 'package:tanfeth_apps/travel/taxi24/taxi24_passenger/presentation/view/choose_ride/vm/choose_ride_map_vm.dart';


class ChooseRideMapWidget extends ConsumerStatefulWidget{

  const ChooseRideMapWidget({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>_ChooseRideMapWidget();

}

class _ChooseRideMapWidget extends ConsumerState<ChooseRideMapWidget>{

  late ChooseRideMapVM chooseRideMapVM;
  late ParamMapModel paramMapModel;

  final Completer<GoogleMapController> completer = Completer();


  @override
  void initState() {
    super.initState();
  }


  initBuild(){
   // chooseRideMapVM = ref.watch(chooseRideMapProvider.notifier);
    paramMapModel = ref.watch(chooseRideMapProvider);
  }



  @override
  Widget build(BuildContext context) {
    initBuild();

    return  SizedBox(
        height: MediaQuery.sizeOf(context).height,
        child: GoogleMap(
          mapType: MapType.normal,
          myLocationButtonEnabled: false,
          initialCameraPosition:
          CameraPosition(zoom:  6,
              target: paramMapModel.currentLatLng),
          tiltGesturesEnabled: true,
          compassEnabled: true,
          scrollGesturesEnabled: true,
          zoomGesturesEnabled: true,
          zoomControlsEnabled: false,
          mapToolbarEnabled: false,
          trafficEnabled: true,
          buildingsEnabled: true,
          myLocationEnabled: true,
          markers: Set<Marker>.of(paramMapModel.markers.toSet()),
          polylines: Set<Polyline>.of(paramMapModel.polyLines.values),
          onMapCreated: (GoogleMapController controller) {
            if (!completer.isCompleted) {
              completer.complete(controller);
            }

          },
        )
    );
  }




}