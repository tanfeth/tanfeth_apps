import 'package:flutter/material.dart';


void showCustomBottomSheetMenu({
  required BuildContext context,
  required Widget child,
  double? height,
  Color? color,
  bool isScrollControlled=false,
  LinearGradient? gradient,
}) {
  showModalBottomSheet(
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(24),
        topRight: Radius.circular(24),
      ),
    ),
    context: context,
    isScrollControlled: isScrollControlled,
    builder: (builder) {
      return gradient == null ? Padding(
        padding: EdgeInsets.symmetric(horizontal: 24, vertical: 20),
        child: Container(
          height: height,
          decoration: BoxDecoration(color: color ?? Colors.transparent,),
          child: child,
        ),) : Container(
        decoration: BoxDecoration(
            shape: BoxShape.rectangle,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(24),
              topRight: Radius.circular(24),
            ),
            gradient: gradient),
        child: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: 24,
              vertical: 20),
          child: Container(
            height: height,
            decoration: BoxDecoration(color: color ?? Colors.transparent, gradient: gradient),
            child: child,
          ),
        ),
      );
    },

  );
}
