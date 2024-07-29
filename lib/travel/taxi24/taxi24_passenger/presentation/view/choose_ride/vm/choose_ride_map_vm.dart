



import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:api_controller/shared/extensions/theme_extensions.dart';
import 'package:tanfeth_apps/common/shared/images.dart';
import 'package:api_controller/vm/langauge/langauge_vm.dart';
import 'package:api_controller/vm/providers_vma/read_model_vma.dart';
import 'package:tanfeth_apps/flavor/init_binding.dart';
import 'package:tanfeth_apps/travel/common/data/model/ParamMapModel.dart';
import 'package:tanfeth_apps/travel/common/vm/map_vm.dart';
import 'package:tanfeth_apps/travel/common/vma/map_vma.dart';
import 'package:tanfeth_apps/travel/taxi24/taxi24_passenger/data/model/LocationModel.dart';
import 'package:tanfeth_apps/travel/taxi24/taxi24_passenger/presentation/view/destination/vm/destination_list_vm.dart';
import 'package:tanfeth_apps/travel/taxi24/taxi24_passenger/presentation/view/home/vm/pick_up_location_vm.dart';
import'package:flutter_polyline_points/flutter_polyline_points.dart';

final chooseRideMapProvider =
StateNotifierProvider.autoDispose<ChooseRideMapVM, ParamMapModel>((ref) {
  ref.keepAlive();
  return ChooseRideMapVM(ref);
});



class ChooseRideMapVM extends
ReadNotifierVMA<ParamMapModel, ParamMapModel, ParamMapModel> with
    MapGenerateMarkerVMA{

  final AutoDisposeStateNotifierProviderRef ref;

  ChooseRideMapVM(this.ref, {ParamMapModel? paramMapModel})
      : super(paramMapModel ?? ParamMapModel()) {
     generateMapMarker(Images.car);
  }



  @override
  void setModel(ParamMapModel model) {
    state = model;
  }


  void updateMapController({required GoogleMapController mapController}){
    state.gMapControl = mapController;
  }

  void updateCameraPosition({required CameraPosition position}){
    state.cameraPosition = position;
  }


  @override
  Future<BitmapDescriptor> generateMapMarker(String imagePath) async {
    final icon = await super.generateMapMarker(imagePath);
    state.defaultMarker = icon;
    return icon;
  }


  void getCurrentLocation({bool setMakers = true}) async {
    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.always || permission == LocationPermission.whileInUse) {
      Position getPosition = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);

      state.currentLatLng = LatLng(getPosition.latitude, getPosition.longitude);
      state.cameraPosition=(CameraPosition(target: LatLng(getPosition.latitude, getPosition.longitude),
          zoom: state.mapZoom));
      animateCameraPosition(currentPosition:LatLng(getPosition.latitude, getPosition.longitude));
      if(setMakers){
        setMarker(currentPosition: LatLng(getPosition.latitude,
            getPosition.longitude), animateCamera: true);
      }else {
        updateModel();
      }

    } else if (permission == LocationPermission.denied) {
      var t = await Geolocator.requestPermission();
      getCurrentLocation();
      if (t == LocationPermission.deniedForever) {
        await Geolocator.openAppSettings();
      }
    }
  }


  void setMarker({required LatLng currentPosition,
    required bool animateCamera})async {
    state.markers.clear();
    state.markers.add(Marker(
      markerId: const MarkerId('location'),
      position: currentPosition,
      icon: state.defaultMarker!,
    ));

   animateCameraPosition(currentPosition: currentPosition);
    updateModel();
  }


  Future<void> getAddressFromLatLong({double? lat , double? long}) async {
    setLocaleIdentifier("${ref.watch(languageProvider)}_${
        ref.watch(languageProvider) == "en"?
            "US":"EG"
    }").then((_) async{
      List<Placemark> placeMarks = await placemarkFromCoordinates(
        lat??state.currentLatLng.latitude,
        long??state.currentLatLng.longitude,);
      Placemark place = placeMarks[0];
      state.currentAddress = "${placeMarks.first.country} , ${placeMarks[0].street}";
      state.currentAddressName = "${place.name}";
    });

  }



  void updateModel(){
    ParamMapModel paramMapModel = ParamMapModel();
    paramMapModel.gMapControl = state.gMapControl;
    paramMapModel.mapZoom = state.mapZoom;
    paramMapModel.currentLatLng = state.currentLatLng;
    paramMapModel.currentAddress = state.currentAddress;
    paramMapModel.defaultMarker = state.defaultMarker;
    paramMapModel.markers = state.markers;
    paramMapModel.from = state.from;
    paramMapModel.cameraPosition = state.cameraPosition;
    paramMapModel.polyLines = state.polyLines;
    paramMapModel.wayLatLng = state.wayLatLng;
    paramMapModel.currentAddressName = state.currentAddressName;
    paramMapModel.startLatLng = state.startLatLng;
    setModel(paramMapModel);
  }


  void animateCameraPosition({required LatLng currentPosition,double? zoom ,}) {

    state.gMapControl!.animateCamera(
      CameraUpdate.newCameraPosition(
        (CameraPosition(target: currentPosition,zoom: zoom??state.mapZoom)),
      ),
    );
    state.currentLatLng = currentPosition;
    state.cameraPosition=
    (CameraPosition(target: currentPosition,zoom: zoom??state.mapZoom));
    state.mapZoom = zoom??14;

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
    state.markers.add(
        Marker(
            consumeTapEvents: true,
            markerId: MarkerId(latLng.toString()),
            position: latLng??const LatLng(0.0, 0.0),
            icon:customIcon
        ));
    if(state.markers.length > 1){
      getDirections(state.markers.toList());
    }

  }


  Future<void> getDirections(List<Marker> markers) async {
    List<LatLng> polylineCoordinates = [];
    List<PolylineWayPoint> polylineWayPoints = [];
    PolylinePoints polylinePoints = PolylinePoints();

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
      for (var point in result.points) {
        polylineCoordinates.add(
            LatLng(point.latitude,
                point.longitude));
      }
    } else {
      log(result.errorMessage.toString());
    }

    addPolyLine(polylineCoordinates);

  }


  void addPolyLine(List<LatLng> polylineCoordinates) {
    PolylineId id = const PolylineId("poly");
    Polyline polyline = Polyline(
      polylineId: id,
      color: Get.context!.color.tertiaryContainer,
      points: polylineCoordinates,
      width: 4,
    );
    state.polyLines[id] = polyline;



    animateCameraPosition(
      currentPosition: LatLng(
          ref.watch(pickUpLocationProvider).latLng?.latitude??0.0,
          polylineCoordinates.last.longitude),
          zoom: 8
    );


   updateModel();
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