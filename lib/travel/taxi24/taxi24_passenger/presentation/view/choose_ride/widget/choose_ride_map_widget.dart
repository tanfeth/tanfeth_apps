import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:tanfeth_apps/travel/common/data/model/ParamMapModel.dart';
import 'package:tanfeth_apps/travel/taxi24/taxi24_passenger/presentation/view/choose_ride/vm/choose_ride_map_vm.dart';


class ChooseRideMapWidget extends ConsumerStatefulWidget{
  const ChooseRideMapWidget();

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>_ChooseRideMapWidget();

}

class _ChooseRideMapWidget extends ConsumerState<ChooseRideMapWidget>{

  late ChooseRideMapVM chooseRideMapVM;
  late ParamMapModel paramMapModel;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }


  initBuild(){
    chooseRideMapVM = ref.watch(chooseRideMapProvider.notifier);
    paramMapModel = ref.watch(chooseRideMapProvider);
  }



  @override
  Widget build(BuildContext context) {
    initBuild();

    return  SizedBox(
        height: MediaQuery.sizeOf(context).height-390,
        child: GoogleMap(
          mapType: MapType.normal,
          myLocationButtonEnabled: false,
          initialCameraPosition:
          CameraPosition(zoom:  paramMapModel.mapZoom,
              target: paramMapModel.currentLatLng),
          tiltGesturesEnabled: true,
          compassEnabled: true,
          scrollGesturesEnabled: true,
          zoomGesturesEnabled: true,
          polylines: Set<Polyline>.of(paramMapModel.polyLines.values),
          markers:  paramMapModel.markers.toSet(),
          onMapCreated: (GoogleMapController controller) {
            ref.read(mapProvider.notifier).
            updateMapController(mapController: controller);
            ref.read(mapProvider.notifier).
            setMarker(currentPosition:  ref.read(mapProvider).currentLatLng,
                animateCamera: true);

          },
        )
    );
  }

}