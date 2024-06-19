import 'dart:ui' as ui;
import 'package:flutter/services.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

mixin  MapGenerateMarkerVMA {
  Future<BitmapDescriptor> generateMapMarker(String imagePath) async {
    final Uint8List endMarker = await getBytesFromAsset(imagePath, 120);
    final icon = BitmapDescriptor.fromBytes(endMarker);
    return icon;
  }

  Future<Uint8List> getBytesFromAsset(String path, int width) async {
    ByteData data = await rootBundle.load(path);
    ui.Codec codec = await ui.instantiateImageCodec(
      data.buffer.asUint8List(),
      targetWidth: width,
    );
    ui.FrameInfo fi = await codec.getNextFrame();
    return (await fi.image.toByteData(format: ui.ImageByteFormat.png))!.buffer.asUint8List();
  }
}
