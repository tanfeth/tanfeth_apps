
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tanfeth_apps/common/shared/sizes.dart';

class ButtonThemes {
  static final double _maxButtonHeight = 40.0;


  static TextButtonThemeData textButtonPrimaryCircularTheme(
      {BuildContext? context, ColorScheme? colorScheme}) {
    colorScheme = colorScheme ?? Theme.of(context ?? Get.context!).colorScheme;
    return TextButtonThemeData(
      style: TextButton.styleFrom(
          backgroundColor: colorScheme.secondary,
          foregroundColor: colorScheme.onSecondary,
          //textButtonColor
          padding: EdgeInsets.symmetric(horizontal: 15, vertical: 0),
          minimumSize: Size(0, _maxButtonHeight),

          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: MySizes.borderRadius,
          )),
    );
  }
  static TextButtonThemeData iconButtonCircleTheme(
      {BuildContext? context, ColorScheme? colorScheme}) {
    colorScheme = colorScheme ?? Theme.of(context ?? Get.context!).colorScheme;
    return TextButtonThemeData(
      style: TextButton.styleFrom(
        backgroundColor: colorScheme.secondary,
        foregroundColor: colorScheme.onSecondary,
        //textButtonColor
        shape: CircleBorder(),
        padding: EdgeInsets.symmetric(horizontal: 15, vertical: 0),
        minimumSize: Size(0, _maxButtonHeight),

        elevation: 0,
      ),
    );
  }

  static TextButtonThemeData textButtonPrimaryRectTheme(
      {BuildContext? context, ColorScheme? colorScheme}) {
    colorScheme = colorScheme ?? Theme.of(context ?? Get.context!).colorScheme;
    return TextButtonThemeData(
      style: TextButton.styleFrom(
          backgroundColor: colorScheme.secondary,
          foregroundColor: colorScheme.onSecondary,
          //textButtonColor
          padding: EdgeInsets.symmetric(horizontal: 15, vertical: 0),
          minimumSize: Size(0, _maxButtonHeight),

          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: MySizes.borderRadius,
          )),
    );
  }

  static TextButtonThemeData transparentTextButton(
      {BuildContext? context, ColorScheme? colorScheme}) {
    colorScheme = colorScheme ?? Theme.of(context ?? Get.context!).colorScheme;
    return TextButtonThemeData(
      style: TextButton.styleFrom(
          backgroundColor: Colors.transparent,
          foregroundColor: colorScheme.onBackground,
          //textButtonColor
          padding: EdgeInsets.symmetric(horizontal: 15, vertical: 0),
          minimumSize: Size(0, _maxButtonHeight),

          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: MySizes.borderRadius,
          )),
    );
  }

  static ButtonStyle strokeButton(TextButtonThemeData buttonThemeData,{required Color color}){
    return buttonThemeData.style!.copyWith(
      backgroundColor:MaterialStatePropertyAll( Colors.transparent),
      foregroundColor:MaterialStatePropertyAll( color),
    );
  }
}
