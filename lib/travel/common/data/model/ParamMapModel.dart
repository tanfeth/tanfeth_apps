

import 'package:google_maps_flutter/google_maps_flutter.dart';

class ParamMapModel {

  GoogleMapController? gMapControl;
  Set<Marker> markers = {};
  Map<PolylineId, Polyline> polyLines = {};
  double mapZoom = 15;
   BitmapDescriptor? defaultMarker;
  LatLng currentLatLng = const LatLng(24.7214143, 46.7077124);
   String currentAddress ='';
  String currentAddressName ='';
   String from = '';
  CameraPosition? cameraPosition;
   LatLng? startLatLng ;
   List<LatLng?> wayLatLng =  [];

  ParamMapModel();

  
}