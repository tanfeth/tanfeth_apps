

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
Future mapFuture = Future.delayed(Duration(milliseconds: 1000), () => true);
bool isMapVisible = false;


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

    return FutureBuilder(
      future: mapFuture,
      builder: (context,snapshot){
        if (!snapshot.hasData) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        return    AnimatedOpacity(
          opacity: isMapVisible ? 1.0 : 0,
          duration: const Duration(milliseconds: 600),
          child: GoogleMap(
            compassEnabled: false,
            mapToolbarEnabled: false,
            myLocationEnabled: true,
            myLocationButtonEnabled: false,
            trafficEnabled: true,
            tiltGesturesEnabled: false,
            zoomControlsEnabled: false,
            mapType: MapType.normal,
            initialCameraPosition:
            CameraPosition(zoom:  paramMapModel.mapZoom,
                target: paramMapModel.currentLatLng),
            onMapCreated: (GoogleMapController controller) {
          
              ref.read(mapProvider.notifier).
              updateMapController(mapController: controller);
              ref.read(mapProvider.notifier).
              setMarker(currentPosition:  ref.read(mapProvider).currentLatLng,
                  animateCamera: true);
              // ref.read(mapProvider.notifier).getCurrentLocation();

              Future.delayed
                (
                  const Duration(milliseconds: 550),
                      () => setState
                    (()
                  {
                    isMapVisible = true;
                  }
                  )
              );

            },
            markers:  paramMapModel.markers.toSet(),
          ),
        );
      },
    );

  }
  
}