
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';


class MapWidget extends ConsumerStatefulWidget{
  const MapWidget({Key? key}) : super(key: key);

  @override
  ConsumerState<MapWidget> createState() => _MapState();
}

class _MapState extends ConsumerState<MapWidget>{

  final Completer<GoogleMapController> mapController =
  Completer<GoogleMapController>();

  double  latitude = 	26.399250;
  double  longitude = 49.984360;

  @override
  Widget build(BuildContext context) {

    return    SizedBox(
      height: MediaQuery.sizeOf(context).height-114,
      child: GoogleMap(
        compassEnabled: false,
        mapToolbarEnabled: false,
        myLocationEnabled: true,
        myLocationButtonEnabled: false,
        trafficEnabled: false,
        tiltGesturesEnabled: false,
        zoomControlsEnabled: false,
        mapType: MapType.normal,
        initialCameraPosition: CameraPosition(bearing: 0,
            target: LatLng(latitude, longitude), zoom: 16),
        onMapCreated: (GoogleMapController controller) {
          mapController.complete(controller);
          //viewModel.googleMapController=controller;
        },
      ),
    );
  }
  
}