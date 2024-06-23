

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:tanfeth_apps/travel/common/data/model/ParamMapModel.dart';
import 'package:tanfeth_apps/travel/common/vm/map_vm.dart';


class MapWidget extends ConsumerStatefulWidget{
  const MapWidget({Key? key}) : super(key: key);

  @override
  ConsumerState<MapWidget> createState() => _MapState();
}

class _MapState extends ConsumerState<MapWidget>{

late ParamMapModel paramMapModel;

  @override
  void initState() {
    super.initState();
  }


  initBuild(){
     paramMapModel =ref.watch(mapProvider);

  }



  @override
  Widget build(BuildContext context) {

    initBuild();

    return    GoogleMap(
      compassEnabled: false,
      mapToolbarEnabled: false,
      myLocationEnabled: true,
      myLocationButtonEnabled: false,
      trafficEnabled: false,
      tiltGesturesEnabled: false,
      zoomControlsEnabled: false,
      mapType: MapType.normal,
      initialCameraPosition:
      CameraPosition(zoom:  paramMapModel.mapZoom,
          target: paramMapModel.currentLatLng),
      onMapCreated: (GoogleMapController controller) {

        ref.read(mapProvider.notifier).
        updateMapController(mapController: controller);

        ref.read(mapProvider.notifier).setMarker(
            currentPosition: paramMapModel.currentLatLng,
            animateCamera: true);
      },
      markers:  paramMapModel.markers.toSet(),
    );
  }
  
}