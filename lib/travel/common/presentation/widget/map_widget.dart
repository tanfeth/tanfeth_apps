
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:tanfeth_apps/travel/common/vm/map_vm.dart';


class MapWidget extends ConsumerStatefulWidget{
  const MapWidget({Key? key}) : super(key: key);

  @override
  ConsumerState<MapWidget> createState() => _MapState();
}

class _MapState extends ConsumerState<MapWidget>{

  @override
  Widget build(BuildContext context) {
    return    GoogleMap(
      compassEnabled: false,
      mapToolbarEnabled: false,
      myLocationEnabled: true,
      myLocationButtonEnabled: false,
      trafficEnabled: false,
      tiltGesturesEnabled: false,
      zoomControlsEnabled: true,
      mapType: MapType.normal,
      initialCameraPosition:
      CameraPosition(zoom:  ref.watch(mapProvider).mapZoom,
          target: ref.watch(mapProvider).currentLatLng),
      onMapCreated: (GoogleMapController controller) {
        ref.read(mapProvider.notifier).
        updateMapController(mapController: controller);
        ref.read(mapProvider.notifier).setMarker(
            currentPosition: ref.watch(mapProvider).currentLatLng,
            animateCamera: true);

      },
      markers:  ref.watch(mapProvider).markers.toSet(),
    );
  }
  
}