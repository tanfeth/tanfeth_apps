import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:tanfeth_apps/common/shared/extensions/theme_extensions.dart';
import 'package:tanfeth_apps/flavor/init_binding.dart';
import 'package:tanfeth_apps/travel/common/data/model/ParamMapModel.dart';
import 'package:tanfeth_apps/travel/taxi24/taxi24_passenger/presentation/view/choose_ride/vm/choose_ride_map_vm.dart';
import'package:flutter_polyline_points/flutter_polyline_points.dart';


class ChooseRideMapWidget extends ConsumerStatefulWidget{
  final LatLng? startLatLng ;
  final List<LatLng?> wayLatLng ;
  const ChooseRideMapWidget({super.key
    ,required this.startLatLng,
   required this.wayLatLng});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>_ChooseRideMapWidget();

}

class _ChooseRideMapWidget extends ConsumerState<ChooseRideMapWidget>{

  late ChooseRideMapVM chooseRideMapVM;
  late ParamMapModel paramMapModel;

  final Completer<GoogleMapController> completer = Completer();
  List<Marker> markers = [];
  PolylinePoints polylinePoints = PolylinePoints();
  Map<PolylineId, Polyline> polyLines = {};

  @override
  void initState() {

    handleMarkersAndPolyLines();

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
          CameraPosition(zoom:  10,
              target: paramMapModel.currentLatLng),
          tiltGesturesEnabled: true,
          compassEnabled: true,
          scrollGesturesEnabled: true,
          zoomGesturesEnabled: true,
          zoomControlsEnabled: false,
          mapToolbarEnabled: false,
          trafficEnabled: false,
          buildingsEnabled: true,
          myLocationEnabled: true,
          markers: Set<Marker>.of(markers.toSet()),
          polylines: Set<Polyline>.of(polyLines.values),
          onMapCreated: (GoogleMapController controller) {
            if (!completer.isCompleted) {
              completer.complete(controller);
            }

          },
        )
    );
  }



  Future<void> addMarker(LatLng? latLng) async{
    markers.add(
        Marker(
            consumeTapEvents: true,
            markerId: MarkerId(latLng.toString()),
            position: latLng??LatLng(0.0, 0.0),
        ));
    if(markers.length > 1){
      getDirections(markers);
    }

  }


  Future<void> getDirections(List<Marker> markers) async {
    List<LatLng> polylineCoordinates = [];
    List<PolylineWayPoint> polylineWayPoints = [];
    for(var i = 0; i<(widget.wayLatLng).length;i++){
      polylineWayPoints.add(PolylineWayPoint(
          location: "${widget.wayLatLng[i]?.latitude.toString()},"
          "${widget.wayLatLng[i]?.longitude.toString()}",stopOver: true));
    }


/// Result gets little bit late as soon as in video,
/// Because package
/// Send http request for getting real road routes

    PolylineResult result = await polylinePoints.getRouteBetweenCoordinates(
      request: PolylineRequest(
        mode: TravelMode.driving,
          avoidFerries: true,
          avoidTolls: true,
          avoidHighways: true,
          optimizeWaypoints: true,
         wayPoints: polylineWayPoints,
        origin: PointLatLng(
            widget.startLatLng!.latitude,
            widget.startLatLng!.longitude), //first added marker
        destination: PointLatLng(
            (widget.wayLatLng).last?.latitude??0.0,
            (widget.wayLatLng).last?.longitude??0.0), //last added marker

      ),
      googleApiKey: customAppFlavor.mapApiKey
    );
    if (result.points.isNotEmpty) {
      result.points.forEach((PointLatLng point) {
        polylineCoordinates.add(
            LatLng(point.latitude,
            point.longitude));
      });
    } else {
      print(result.errorMessage);
    }

    addPolyLine(polylineCoordinates);

  }


  void addPolyLine(List<LatLng> polylineCoordinates) {
    PolylineId id = PolylineId("poly");
    Polyline polyline = Polyline(
      polylineId: id,
      color: context.color.primary,
      points: polylineCoordinates,
      width: 4,
    );
    polyLines[id] = polyline;

    setState(() {});
  }

  void handleMarkersAndPolyLines() {
    widget.wayLatLng.add(widget.startLatLng);
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      for(int i =0 ; i <( (widget.wayLatLng.length)) ; i++ ){
        addMarker(widget.wayLatLng[i]);
      }
    });



  }


}