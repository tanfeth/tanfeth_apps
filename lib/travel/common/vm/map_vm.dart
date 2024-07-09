



import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:tanfeth_apps/common/shared/images.dart';
import 'package:tanfeth_apps/common/vm/providers_vma/read_model_vma.dart';
import 'package:tanfeth_apps/travel/common/data/model/ParamMapModel.dart';
import 'package:tanfeth_apps/travel/common/vma/map_vma.dart';



final mapProvider =
StateNotifierProvider.autoDispose<MapVM, ParamMapModel>((ref) {
  ref.keepAlive();
  return MapVM(ref);
});



class MapVM extends
ReadNotifierVMA<ParamMapModel, ParamMapModel, ParamMapModel> with
    MapGenerateMarkerVMA{

  final AutoDisposeStateNotifierProviderRef ref;

  MapVM(this.ref, {ParamMapModel? paramMapModel})
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
      state.gMapControl!.animateCamera(
        CameraUpdate.newCameraPosition(
          (CameraPosition(target: LatLng(getPosition.latitude, getPosition.longitude),
              zoom: state.mapZoom)),
        ),
      );
      state.currentLatLng = LatLng(getPosition.latitude, getPosition.longitude);
      state.cameraPosition=(CameraPosition(target: LatLng(getPosition.latitude, getPosition.longitude),
          zoom: state.mapZoom));
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

    await generateMapMarker(Images.car);
    state.markers.clear();
    state.markers.add(Marker(
      markerId: const MarkerId('location'),
      rotation: 50,
      position: currentPosition,
      icon: state.defaultMarker!,
    ));

    if (animateCamera) {
      state.gMapControl!.animateCamera(
        CameraUpdate.newCameraPosition(
          (CameraPosition(target: currentPosition, zoom: state.mapZoom)),
        ),
      );

      state.cameraPosition=
      (CameraPosition(target: currentPosition, zoom: state.mapZoom));
    }
    updateModel();
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
    setModel(paramMapModel);
  }
}