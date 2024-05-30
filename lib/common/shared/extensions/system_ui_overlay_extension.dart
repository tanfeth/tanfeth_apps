import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:tanfeth_apps/common/shared/extensions/theme_extensions.dart';

extension StatusBarWidget on Widget {
  Widget systemUiDarkText(BuildContext context) => AnnotatedRegion<SystemUiOverlayStyle>(
        value: Platform.isIOS
            ? SystemUiOverlayStyle.dark
            : SystemUiOverlayStyle(
                systemNavigationBarColor: context.color.surface,
                systemNavigationBarIconBrightness: Brightness.dark,
                statusBarIconBrightness: Brightness.dark,
                statusBarColor: Colors.transparent,
              ),
        child: this,
      );

  Widget systemUiLightText(BuildContext context) => AnnotatedRegion<SystemUiOverlayStyle>(
        value: Platform.isIOS
            ? SystemUiOverlayStyle.light
            : SystemUiOverlayStyle(
                systemNavigationBarColor: context.color.surface,
                systemNavigationBarIconBrightness: Brightness.light,
                statusBarIconBrightness: Brightness.light,
                statusBarColor: Colors.transparent,
              ),
        child: this,
      );

  Widget systemUiCustom(
    BuildContext context,
    SystemUiOverlayStyle iosStyle,
    Color bColor,
    Brightness bBrightness,
    Color tColor,
    Brightness tBrightness,
  ) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: Platform.isIOS
          ? iosStyle
          : SystemUiOverlayStyle(
              systemNavigationBarColor: bColor,
              systemNavigationBarIconBrightness: bBrightness,
              statusBarIconBrightness: tBrightness,
              statusBarColor: tColor,
            ),
      child: this,
    );
  }
}
