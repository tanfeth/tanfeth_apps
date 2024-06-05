import 'dart:convert';

import 'package:flutter/material.dart';

class ImageConverter extends StatelessWidget {
  final String base64String;
  final BoxFit fit;


  const ImageConverter({super.key, required this.base64String, this.fit = BoxFit.cover});

  @override
  Widget build(BuildContext context) {
    return Image.memory(
      base64Decode(base64String),
      fit: fit,

    );
  }
}