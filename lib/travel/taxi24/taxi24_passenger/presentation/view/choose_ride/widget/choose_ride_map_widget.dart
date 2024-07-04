import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:tanfeth_apps/common/shared/extensions/theme_extensions.dart';
import 'package:tanfeth_apps/common/shared/images.dart';
import 'package:tanfeth_apps/flavor/init_binding.dart';
import 'package:tanfeth_apps/travel/common/data/model/ParamMapModel.dart';
import 'package:tanfeth_apps/travel/common/vm/map_vm.dart';
import 'package:tanfeth_apps/travel/taxi24/taxi24_passenger/data/model/LocationModel.dart';
import 'package:tanfeth_apps/travel/taxi24/taxi24_passenger/presentation/view/choose_ride/vm/choose_ride_map_vm.dart';
import'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:tanfeth_apps/travel/taxi24/taxi24_passenger/presentation/view/destination/vm/destination_list_vm.dart';
import 'package:tanfeth_apps/travel/taxi24/taxi24_passenger/presentation/view/home/vm/pick_up_location_vm.dart';


class ChooseRideMapWidget extends ConsumerStatefulWidget{

  const ChooseRideMapWidget({super.key});

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
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      handleMarkersAndPolyLines();
    });


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



  Future<void> addMarker(LatLng? latLng,{int? index}) async{
    late BitmapDescriptor customIcon;

    if(index != null && index == 0){
      customIcon=  await ref.read(mapProvider.notifier).generateMapMarker(
        Images.pickUpImage
      );
    }else {
      customIcon=  await ref.read(mapProvider.notifier).generateMapMarker(
          Images.destinationMarker
      );
    }
    markers.add(
        Marker(
            consumeTapEvents: true,
            markerId: MarkerId(latLng.toString()),
            position: latLng??LatLng(0.0, 0.0),
            icon:customIcon
        ));
    if(markers.length > 1){
      getDirections(markers);
    }

  }


  Future<void> getDirections(List<Marker> markers) async {
    List<LatLng> polylineCoordinates = [];
    List<PolylineWayPoint> polylineWayPoints = [];
    for(var i = 0; i<(ref.watch(destinationListProvider)).length;i++){
      polylineWayPoints.add(PolylineWayPoint(
          location: "${ref.watch(destinationListProvider)[i].latLng?.latitude.toString()},"
          "${ref.watch(destinationListProvider)[i].latLng?.longitude.toString()}",stopOver: true));
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
            ref.watch(pickUpLocationProvider).latLng!.latitude,
            ref.watch(pickUpLocationProvider).latLng!.longitude), //first added marker
        destination: PointLatLng(
            (ref.watch(destinationListProvider)).last.latLng?.latitude??0.0,
            (ref.watch(destinationListProvider)).last.latLng?.longitude??0.0), //last added marker

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
      color: context.color.tertiaryContainer,
      points: polylineCoordinates,
      width: 4,
    );
    polyLines[id] = polyline;

    setState(() {});
  }

  void handleMarkersAndPolyLines() {
    List<LocationModel> list = [];
    list.addAll(ref.watch(destinationListProvider));
    list.insert(0, ref.watch(pickUpLocationProvider));
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      for(int i =0 ; i <( (list.length)) ; i++ ){
        addMarker(list[i].latLng,index :i);
      }
    });



  }


}