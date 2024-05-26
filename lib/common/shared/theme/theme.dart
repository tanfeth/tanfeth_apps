import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';
import 'package:tanfeth_apps/common/shared/sizes.dart';

abstract class ITheme {
  ThemeData getTheme(Brightness brightness);

  InputDecoration searchInputDecoration(Brightness brightness);
}


class MyTheme extends ITheme {
  static var fontFamily = "DinNext";

  ColorScheme getCurrentColorScheme({required Brightness brightness}) {
    return (brightness) == Brightness.dark ? colorSchemeDark : colorSchemeLight;
  }

  static const colorSchemeLight = ColorScheme(
    brightness: Brightness.light,
    primary: Color(0xFFF4B607),
    onPrimary: Color(0xFFffffff),
    background: Color(0xFFffffff),
    onBackground: Color(0xFF000000),
    primaryContainer: Color(0xFFF1F1F1),
    onPrimaryContainer: Color(0xffB4B4B4),
    secondary: Color(0xFFD03E3E),
    onSecondary: Color(0xFFffffff),
    error: Color(0xffD0021B),
    onSurface: Color(0xFFFC9403),
    surfaceTint: Color(0xffF5ECDC),
    tertiary: Color(0xff82B936),
    surface: Color(0xFF7D7D7D),
    inverseSurface: Color(0xff4BD12A),
    inversePrimary: Color(0xffF5A623),
    onTertiary: Color(0xff39B54A),
    //// not edited
    onError: Color(0xffffffff),
    outline: Color(0xFFC5C5C5),
    shadow: Color(0xff6CBCEA),
    secondaryContainer: Color(0xff4A4A4A),
    onSecondaryContainer: Color(0xffF9E9F4),
    onTertiaryContainer: Color(0xffF9E9F4),
    errorContainer: Colors.red,
    onErrorContainer: Color(0xffffffff),
    surfaceVariant: Color(0xff9B9B9B),
    onSurfaceVariant: Color(0xff8EBFE9),
    onInverseSurface: Color(0xffEAF0F4),
  );

  static const colorSchemeDark = ColorScheme(
    brightness: Brightness.light,
    primary: Color(0xFFF4B607),
    onPrimary: Color(0xFFffffff),
    background: Color(0xFFF8F8F8),
    onBackground: Color(0xFF121112),
    primaryContainer: Color(0xffF1F1F1),
    onPrimaryContainer: Color(0xff9093A3),
    secondary: Color(0xFFD03E3E),
    onSecondary: Color(0xFFffffff),
    error: Colors.red,
    onError: Color(0xffffffff),
    tertiary: Color(0xff60C547),
    shadow: Color(0xff6CBCEA),
    secondaryContainer: Color(0xff4A4A4A),
    onSecondaryContainer: Color(0xffF9E9F4),
    onTertiary: Color(0xffF9E9F4),
    tertiaryContainer: Color(0xff31328A),
    onTertiaryContainer: Color(0xffF9E9F4),
    errorContainer: Colors.red,
    onErrorContainer: Color(0xffffffff),
    surface: Color(0xFF989898),
    onSurface: Color(0xFF44362C),
    surfaceVariant: Color(0xff9B9B9B),
    onSurfaceVariant: Color(0xff8EBFE9),
    outline: Color(0xFFE4E4E4),
    onInverseSurface: Color(0xffEAF0F4),
    inverseSurface: Color(0xff4BD12A),
    inversePrimary: Color(0xffF5A623),
    surfaceTint: Color(0xff31328A),
  );

  @override
  ThemeData getTheme(Brightness brightness) {
    var colorScheme = getCurrentColorScheme(brightness: brightness);
    var textTheme = getTextTheme(brightness: brightness);
    return ThemeData(
      useMaterial3: true,
      scaffoldBackgroundColor: colorScheme.background,
      primaryColor: colorScheme.primary,
      fontFamily: fontFamily,
      datePickerTheme: DatePickerThemeData(
        backgroundColor: colorScheme.background,
        shape: RoundedRectangleBorder(borderRadius: MySizes.borderRadius),
      ),
      timePickerTheme: TimePickerThemeData(
        backgroundColor: colorScheme.background,
        dayPeriodTextColor: colorScheme.onBackground,
        hourMinuteColor: MaterialStateColor.resolveWith(
              (states) =>
          states.contains(MaterialState.selected) ? colorScheme.primaryContainer : colorScheme.primaryContainer,
        ),
        hourMinuteTextColor: MaterialStateColor.resolveWith(
              (states) => states.contains(MaterialState.selected) ? colorScheme.onBackground : colorScheme.onBackground,
        ),
        dayPeriodShape: RoundedRectangleBorder(borderRadius: MySizes.borderRadius),
        dayPeriodBorderSide: BorderSide(width: 1.5, color: colorScheme.primaryContainer),
        dayPeriodColor: MaterialStateColor.resolveWith(
              (states) => states.contains(MaterialState.selected) ? colorScheme.secondary : colorScheme.primaryContainer,
        ),
        dialBackgroundColor: colorScheme.primaryContainer,
        hourMinuteTextStyle: textTheme.headlineSmall,
        helpTextStyle: textTheme.bodyLarge,
      ),
      textTheme: textTheme,
      inputDecorationTheme: inputDecorationTheme(brightness: brightness),
      elevatedButtonTheme: elevatedButtonThemeData(brightness: brightness),
      outlinedButtonTheme: outlinedButtonThemeData(brightness: brightness),
      textButtonTheme: textButtonThemeData(brightness: brightness),
      checkboxTheme: CheckboxThemeData(
        fillColor: MaterialStatePropertyAll(colorScheme.primary),
        checkColor: MaterialStatePropertyAll(colorScheme.onPrimary),
        side: BorderSide(width: 2, color: colorScheme.onPrimaryContainer),
      ),
      colorScheme: colorScheme.copyWith(background: colorScheme.background),
      splashColor: colorScheme.primaryContainer.withOpacity(.5),
      highlightColor: colorScheme.primaryContainer.withOpacity(.5),
      switchTheme: switchThemeData(brightness: brightness),
      floatingActionButtonTheme: floatingActionButtonTheme(brightness: brightness),
    );
  }

  @override
  InputDecoration searchInputDecoration(Brightness brightness) {
    var colorScheme = getCurrentColorScheme(brightness: brightness);
    return const TextField().decoration!.copyWith(
      contentPadding: const EdgeInsets.symmetric(horizontal: MySizes.largePadding),
      hintStyle: getTextTheme(brightness: brightness).bodyLarge?.copyWith(
        color: colorScheme.onPrimaryContainer,
        height: 2.4,
      ),
      fillColor: colorScheme.primaryContainer,
      filled: true,
      isDense: false,
      border: OutlineInputBorder(
        borderSide: BorderSide(width: 1.5, color: colorScheme.primaryContainer),
        borderRadius: MySizes.circleBorderRadius,
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(width: 1.5, color: colorScheme.primary),
        borderRadius: MySizes.circleBorderRadius,
      ),
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(width: 1.5, color: colorScheme.primaryContainer),
        borderRadius: MySizes.circleBorderRadius,
      ),
      errorBorder: OutlineInputBorder(
        borderSide: BorderSide(width: 1.5, color: colorScheme.error),
        borderRadius: MySizes.circleBorderRadius,
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderSide: BorderSide(width: 1.5, color: colorScheme.error),
        borderRadius: MySizes.circleBorderRadius,
      ),
      suffixIcon: Container(
        width: MySizes.buttonHeight,
        height: MySizes.buttonHeight,
        margin: const EdgeInsetsDirectional.only(start: MySizes.defaultPadding * .25),
        child: Transform.scale(
            scaleX: -1,
            child: Icon(LineIcons.search, size: MySizes.largePadding * .75, color: colorScheme.onPrimaryContainer)),
      ),
    );
  }

  TextTheme getTextTheme({required Brightness brightness}) {
    var colorScheme = getCurrentColorScheme(brightness: brightness);
    return TextTheme(
      displayLarge: TextStyle(color: colorScheme.onBackground, fontSize: 96, fontWeight: FontWeight.w400),
      displayMedium: TextStyle(color: colorScheme.onBackground, fontSize: 60, fontWeight: FontWeight.w400),
      displaySmall: TextStyle(color: colorScheme.onBackground, fontSize: 48, fontWeight: FontWeight.w400),
      headlineMedium: TextStyle(color: colorScheme.onBackground, fontSize: 34, fontWeight: FontWeight.w400),
      headlineSmall: TextStyle(color: colorScheme.onBackground, fontSize: 24, fontWeight: FontWeight.w700),
      titleLarge: TextStyle(color: colorScheme.onBackground, fontSize: 20, fontWeight: FontWeight.w800),
      titleMedium: TextStyle(color: colorScheme.onBackground, fontSize: 18, fontWeight: FontWeight.w700),
      titleSmall: TextStyle(color: colorScheme.onBackground, fontSize: 16, fontWeight: FontWeight.w400),
      bodyLarge: TextStyle(color: colorScheme.onBackground, fontSize: 15, fontWeight: FontWeight.w500),
      bodyMedium: TextStyle(color: colorScheme.onBackground, fontSize: 14, fontWeight: FontWeight.w400),
      labelLarge: TextStyle(color: colorScheme.onBackground, fontSize: 14, fontWeight: FontWeight.w800),
      bodySmall: TextStyle(color: colorScheme.onBackground, fontSize: 13, fontWeight: FontWeight.w400),
      labelSmall: TextStyle(color: colorScheme.onBackground, fontSize: 11, fontWeight: FontWeight.w400),
    );
  }

  TextButtonThemeData textButtonThemeData({required Brightness brightness}) {
    var colorScheme = getCurrentColorScheme(brightness: brightness);
    return TextButtonThemeData(
      style: ButtonStyle(
        textStyle: MaterialStateProperty.all<TextStyle?>(
          getTextTheme(brightness: brightness).bodyMedium?.copyWith(
            fontFamily: fontFamily,
            fontSize: 13,
            height: 2,
            fontWeight: FontWeight.w600,
          ),
        ),
        overlayColor: MaterialStateProperty.all<Color?>(colorScheme.primaryContainer.withOpacity(.6)),
        foregroundColor: MaterialStateProperty.all<Color?>(colorScheme.onPrimaryContainer),
        shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: MySizes.circleBorderRadius)),
        shadowColor: MaterialStateProperty.all<Color?>(Colors.transparent),
        elevation: MaterialStateProperty.all<double>(0),
        padding: MaterialStateProperty.all<EdgeInsetsGeometry>(const EdgeInsets.symmetric(horizontal: 10, vertical: 0)),
      ),
    );
  }

  OutlinedButtonThemeData outlinedButtonThemeData({required Brightness brightness}) {
    var colorScheme = getCurrentColorScheme(brightness: brightness);
    return OutlinedButtonThemeData(
      style: ButtonStyle(
        textStyle: MaterialStateProperty.all<TextStyle?>(
          getTextTheme(brightness: brightness).labelLarge?.copyWith(
            fontFamily: fontFamily,
            height: 2.3,
          ),
        ),
        foregroundColor: MaterialStateProperty.all<Color?>(colorScheme.primary),
        backgroundColor: MaterialStateProperty.all<Color?>(colorScheme.onPrimary),
        overlayColor: MaterialStateProperty.all<Color?>(colorScheme.onPrimaryContainer.withOpacity(.07)),
        shadowColor: MaterialStateProperty.all<Color?>(Colors.transparent),
        elevation: MaterialStateProperty.all<double>(0),
        minimumSize: MaterialStateProperty.all<Size>(const Size(double.infinity, MySizes.buttonHeight)),
        padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
          const EdgeInsets.symmetric(horizontal: MySizes.defaultPadding),
        ),
        shape: MaterialStateProperty.all<OutlinedBorder>(
          RoundedRectangleBorder(borderRadius: MySizes.circleBorderRadius),
        ),
        side: MaterialStateProperty.all<BorderSide>(BorderSide(color: colorScheme.primary, width: 2)),
      ),
    );
  }

  InputDecorationTheme inputDecorationTheme({required Brightness brightness}) {
    var colorScheme = getCurrentColorScheme(brightness: brightness);
    return InputDecorationTheme(
      contentPadding: const EdgeInsets.symmetric(horizontal: MySizes.largePadding),
      hintStyle: getTextTheme(brightness: brightness).bodyMedium?.copyWith(
        color: colorScheme.onPrimaryContainer,
        fontWeight: FontWeight.w500,
        height: 2.3,
      ),
      errorStyle: getTextTheme(brightness: brightness).bodySmall?.copyWith(
        color: colorScheme.error,
        height: 1.2,
      ),
      filled: true,
      fillColor: colorScheme.primaryContainer,
      isDense: false,
      errorMaxLines: 2,
      border: OutlineInputBorder(
        borderSide: BorderSide(width: 1.5, color: colorScheme.primaryContainer),
        borderRadius: MySizes.circleBorderRadius,
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(width: 1.5, color: colorScheme.primary),
        borderRadius: MySizes.circleBorderRadius,
      ),
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(width: 1.5, color: colorScheme.primaryContainer),
        borderRadius: MySizes.circleBorderRadius,
      ),
      errorBorder: OutlineInputBorder(
        borderSide: BorderSide(width: 1.5, color: colorScheme.error),
        borderRadius: MySizes.circleBorderRadius,
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderSide: BorderSide(width: 1.5, color: colorScheme.error),
        borderRadius: MySizes.circleBorderRadius,
      ),
    );
  }

  ElevatedButtonThemeData elevatedButtonThemeData({required Brightness brightness}) {
    var colorScheme = getCurrentColorScheme(brightness: brightness);
    return ElevatedButtonThemeData(
      style: ButtonStyle(
        textStyle: MaterialStateProperty.all<TextStyle?>(
          getTextTheme(brightness: brightness).labelLarge?.copyWith(
            fontFamily: fontFamily,
            height: 1.8,
          ),
        ),
        backgroundColor: MaterialStateProperty.resolveWith<Color?>((Set<MaterialState> states) {
          if (states.contains(MaterialState.disabled)) {
            return colorScheme.primary.withOpacity(.5);
          } else {
            return colorScheme.primary;
          }
        }),
        foregroundColor: MaterialStateProperty.all<Color?>(colorScheme.onPrimary),
        elevation: MaterialStateProperty.all<double>(0),
        shadowColor: MaterialStateProperty.all<Color?>(Colors.transparent),
        minimumSize: MaterialStateProperty.all<Size>(const Size(double.infinity, MySizes.buttonHeight)),
        padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
          const EdgeInsets.symmetric(horizontal: MySizes.defaultPadding),
        ),
        shape: MaterialStateProperty.all<OutlinedBorder>(
          RoundedRectangleBorder(borderRadius: MySizes.circleBorderRadius),
        ),
      ),
    );
  }

  SwitchThemeData switchThemeData({required Brightness brightness}) {
    var colorScheme = getCurrentColorScheme(brightness: brightness);
    return SwitchThemeData(
      thumbColor: MaterialStateProperty.resolveWith<Color?>((Set<MaterialState> states) {
        if (states.contains(MaterialState.selected)) {
          return colorScheme.onPrimary;
        } else {
          return colorScheme.onPrimaryContainer;
        }
      }),
      trackColor: MaterialStateProperty.resolveWith<Color?>((Set<MaterialState> states) {
        if (states.contains(MaterialState.selected)) {
          return colorScheme.secondary;
        } else {
          return Colors.transparent;
        }
      }),
      trackOutlineColor: MaterialStateProperty.resolveWith<Color?>((Set<MaterialState> states) {
        if (states.contains(MaterialState.selected)) {
          return Colors.transparent;
        } else {
          return colorScheme.onPrimaryContainer;
        }
      }),
      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
    );
  }

  FloatingActionButtonThemeData floatingActionButtonTheme({required Brightness brightness}) {
    var colorScheme = getCurrentColorScheme(brightness: brightness);
    return FloatingActionButtonThemeData(
      foregroundColor: colorScheme.onSecondary,
      backgroundColor: colorScheme.secondary,
      splashColor: colorScheme.onSecondary.withOpacity(.07),
      elevation: 0,
      highlightElevation: 0,
      focusElevation: 0,
      hoverElevation: 0,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(40)),
      ),
    );
  }
}