

import 'package:google_maps_flutter/google_maps_flutter.dart';

class ParamMapModel {

  GoogleMapController? gMapControl;
  Set<Marker> markers = {};
  double mapZoom = 14;
   BitmapDescriptor? defaultMarker;
  LatLng currentLatLng = const LatLng(24.7214143, 46.7077124);
   String currentAddress ='';
   String from = '';

  ParamMapModel({
  GoogleMapController? gMapControl,
  Set<Marker>? markers ,
  double? mapZoom ,
  BitmapDescriptor? defaultMarker,
  LatLng? currentLatLng ,
  String? currentAddress,
  String? from,
});

  
}