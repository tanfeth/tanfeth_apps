import 'package:flutter/material.dart';

class WebWidth extends StatelessWidget {
  final Widget child;
  final double width;
  final bool isCenter;
  const WebWidth({required this.child, this.width = 800, this.isCenter = true});

  const WebWidth.input({required this.child, this.width = 300, this.isCenter = false});

  @override
  Widget build(BuildContext context) {
    var widget =
    Container(constraints: BoxConstraints(maxWidth: width), child: child);
    return isCenter ? Center(child: widget) : widget;
  }
}