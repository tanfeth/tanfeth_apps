import 'dart:ui' as ui;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

mixin  MapGenerateMarkerVMA {
  Future<BitmapDescriptor> generateMapMarker(String imagePath) async {
    var imageFile = await rootBundle.load(imagePath);
    var pictureRecorder = ui.PictureRecorder();
    var canvas = Canvas(pictureRecorder);
    var imageUint8List = imageFile.buffer.asUint8List();
    var codec = await ui.instantiateImageCodec(imageUint8List);
    var imageFI = await codec.getNextFrame();

    //Set the filter for the image, the default is low.
    paintImage(
        canvas: canvas,
        rect: const Rect.fromLTWH(0, 0, 25, 25),
        image: imageFI.image,
        filterQuality: FilterQuality.high);

    var image = await pictureRecorder
        .endRecording()
        .toImage(25, 25);
    var data = await image.toByteData(format: ui.ImageByteFormat.png);
    return BitmapDescriptor.bytes(data!.buffer.asUint8List());
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
