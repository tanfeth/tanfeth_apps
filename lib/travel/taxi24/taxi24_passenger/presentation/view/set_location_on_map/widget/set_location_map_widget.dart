import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:tanfeth_apps/travel/common/data/model/ParamMapModel.dart';
import 'package:tanfeth_apps/travel/common/vm/map_vm.dart';
import 'package:tanfeth_apps/travel/taxi24/taxi24_passenger/presentation/view/set_location_on_map/vm/set_on_location_map_vm.dart';


class SetLocationMapWidget extends ConsumerStatefulWidget{
  const SetLocationMapWidget();

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _SetLocationMapWidget();

}

class _SetLocationMapWidget extends ConsumerState<SetLocationMapWidget>{


  late ParamMapModel paramMapModel;



  initBuild(){
    paramMapModel =ref.watch(setOnLocationMapProvider);

  }


  @override
  void initState() {
    super.initState();
  }




  @override
  Widget build(BuildContext context) {
    initBuild();

    return   GoogleMap(
      compassEnabled: false,
      mapToolbarEnabled: false,
      myLocationEnabled: true,
      myLocationButtonEnabled: false,
      zoomControlsEnabled: false,
      mapType: MapType.normal,
      initialCameraPosition:
      CameraPosition(zoom:  paramMapModel.mapZoom,
          target: paramMapModel.currentLatLng),
      onMapCreated: (GoogleMapController controller)  async {
        ref.read(setOnLocationMapProvider.notifier).
         updateMapController(mapController: controller);

       await ref.read(setOnLocationMapProvider.notifier).
       getAddressFromLatLong();
      },
      onCameraMove: (CameraPosition position) {
        ref.read(setOnLocationMapProvider.notifier).
        updateCameraPosition(position: position);
      },
      onCameraIdle: () async {
        await ref.read(setOnLocationMapProvider.notifier).
        getAddressFromLatLong();
      },

    );

  }

}