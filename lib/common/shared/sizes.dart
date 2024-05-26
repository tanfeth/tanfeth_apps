import 'package:flutter/material.dart';

class MySizes {
  static const double appBarHeight = 60.0;
  static const double defaultPadding = 15.0;
  static const double largePadding = 30.0;
  static const double buttonHeight = 48.0;
  static const double circleRadius = 30.0;
  static const double defaultRadius = 10.0;
  static final circleBorderRadius = BorderRadius.circular(MySizes.circleRadius);
  static final borderRadius = BorderRadius.circular(MySizes.defaultRadius);

  static List<BoxShadow> defaultBoxShadow(BuildContext context) {
    return [
      BoxShadow(
        color: Theme.of(context).colorScheme.primaryContainer,
        blurRadius: 6,
        spreadRadius: 2,
        offset: const Offset(2, 2),
      ),
    ];
  }

  static List<BoxShadow> navigationBarBoxShadow(BuildContext context) {
    return [
      BoxShadow(
        color: Theme.of(context).colorScheme.primaryContainer,
        blurRadius: 10,
        spreadRadius: 5,
      ),
    ];
  }
}
