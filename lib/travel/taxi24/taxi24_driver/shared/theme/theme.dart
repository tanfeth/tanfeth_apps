import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';
import 'package:api_controller/shared/sizes.dart';
import 'package:tanfeth_apps/common/shared/theme/theme.dart';


class Taxi24DriverTheme extends ITheme {
  static var fontFamily = "DinNext";

  ColorScheme getCurrentColorScheme({required Brightness brightness}) {
    return (brightness) == Brightness.dark ? colorSchemeDark :
    colorSchemeLight;
  }

  static const colorSchemeLight = ColorScheme(
    brightness: Brightness.light,
    primary: Color(0xFFF4B607),
    onPrimary: Color(0xFFffffff),
    surface: Color(0xFFffffff),
    onSurface: Color(0xFF000000),
    primaryContainer: Color(0xFFF1F1F1),
    onPrimaryContainer: Color(0xffB4B4B4),
    tertiaryContainer: Color(0xFF286AE4),
    secondary: Color(0xFFD03E3E),
    onSecondary: Color(0xFFffffff),
    error: Color(0xffD0021B),
    surfaceTint: Color(0xffF5ECDC),
    tertiary: Color(0xff207538),
    inverseSurface: Color(0xff4BD12A),
    inversePrimary: Color(0xffF5A623),
    onTertiary: Color(0xFFffffff),
    //// not edited
    onError: Color(0xffffffff),
    outline: Color(0xFFC5C5C5),
    shadow: Color(0xff6CBCEA),
    secondaryContainer: Color(0xff4A4A4A),
    onSecondaryContainer: Color(0xffF9E9F4),
    onTertiaryContainer: Color(0xffF9E9F4),
    errorContainer: Colors.red,
    onErrorContainer: Color(0xffffffff),
    surfaceContainerHighest: Color(0xff9B9B9B),
    onSurfaceVariant: Color(0xff8EBFE9),
    onInverseSurface: Color(0xffEAF0F4),
  );

  static const colorSchemeDark = ColorScheme(
    brightness: Brightness.light,
    primary: Color(0xFFF4B607),
    onPrimary: Color(0xFFffffff),
    surface: Color(0xFF000000),
    onSurface: Color(0xFFffffff),
    primaryContainer: Color(0xffF1F1F1),
    onPrimaryContainer: Color(0xff9093A3),
    secondary: Color(0xFFD03E3E),
    onSecondary: Color(0xFFffffff),
    error: Colors.red,
    onError: Color(0xffffffff),
    tertiary: Color(0xff207538),
    shadow: Color(0xff6CBCEA),
    secondaryContainer: Color(0xff4A4A4A),
    onSecondaryContainer: Color(0xffF9E9F4),
    onTertiary: Color(0xFFffffff),
    tertiaryContainer: Color(0xFF286AE4),
    onTertiaryContainer: Color(0xffF9E9F4),
    errorContainer: Colors.red,
    onErrorContainer: Color(0xffffffff),
    surfaceContainerHighest: Color(0xff9B9B9B),
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
      scaffoldBackgroundColor: colorScheme.surface,
      primaryColor: colorScheme.primary,
      fontFamily: fontFamily,
      datePickerTheme: DatePickerThemeData(
        backgroundColor: colorScheme.surface,
        shape: RoundedRectangleBorder(borderRadius: MySizes.borderRadius),
      ),
      timePickerTheme: TimePickerThemeData(
        backgroundColor: colorScheme.surface,
        dayPeriodTextColor: colorScheme.onSurface,
        hourMinuteColor: WidgetStateColor.resolveWith(
          (states) =>
              states.contains(WidgetState.selected) ? colorScheme.primaryContainer : colorScheme.primaryContainer,
        ),
        hourMinuteTextColor: WidgetStateColor.resolveWith(
          (states) => states.contains(WidgetState.selected) ? colorScheme.onSurface : colorScheme.onSurface,
        ),
        dayPeriodShape: RoundedRectangleBorder(borderRadius: MySizes.borderRadius),
        dayPeriodBorderSide: BorderSide(width: 1.5, color: colorScheme.primaryContainer),
        dayPeriodColor: WidgetStateColor.resolveWith(
          (states) => states.contains(WidgetState.selected) ? colorScheme.secondary : colorScheme.primaryContainer,
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
        fillColor: WidgetStatePropertyAll(colorScheme.primary),
        checkColor: WidgetStatePropertyAll(colorScheme.onPrimary),
        side: BorderSide(width: 2, color: colorScheme.onPrimaryContainer),
      ),
      colorScheme: colorScheme.copyWith(surface: colorScheme.surface),
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
      displayLarge: TextStyle(color: colorScheme.onSurface, fontSize: 96, fontWeight: FontWeight.w400),
      displayMedium: TextStyle(color: colorScheme.onSurface, fontSize: 60, fontWeight: FontWeight.w400),
      displaySmall: TextStyle(color: colorScheme.onSurface, fontSize: 48, fontWeight: FontWeight.w400),
      headlineMedium: TextStyle(color: colorScheme.onSurface, fontSize: 34, fontWeight: FontWeight.w400),
      headlineSmall: TextStyle(color: colorScheme.onSurface, fontSize: 24, fontWeight: FontWeight.w700),
      titleLarge: TextStyle(color: colorScheme.onSurface, fontSize: 20, fontWeight: FontWeight.w800),
      titleMedium: TextStyle(color: colorScheme.onSurface, fontSize: 18, fontWeight: FontWeight.w700),
      titleSmall: TextStyle(color: colorScheme.onSurface, fontSize: 16, fontWeight: FontWeight.w400),
      bodyLarge: TextStyle(color: colorScheme.onSurface, fontSize: 15, fontWeight: FontWeight.w500),
      bodyMedium: TextStyle(color: colorScheme.onSurface,
          fontSize: 14,
          fontWeight: FontWeight.w400,
      ),
      labelLarge: TextStyle(color: colorScheme.onSurface, fontSize: 14, fontWeight: FontWeight.w800),
      bodySmall: TextStyle(color: colorScheme.onSurface, fontSize: 13, fontWeight: FontWeight.w400),
      labelSmall: TextStyle(color: colorScheme.onSurface, fontSize: 11, fontWeight: FontWeight.w400),
    );
  }

  TextButtonThemeData textButtonThemeData({required Brightness brightness}) {
    var colorScheme = getCurrentColorScheme(brightness: brightness);
    return TextButtonThemeData(
      style: ButtonStyle(
        textStyle: WidgetStateProperty.all<TextStyle?>(
          getTextTheme(brightness: brightness).bodyMedium?.copyWith(
                fontFamily: fontFamily,
                fontSize: 13,
                height: 2,
                fontWeight: FontWeight.w600,
              ),
        ),
        overlayColor: WidgetStateProperty.all<Color?>(colorScheme.primaryContainer.withOpacity(.6)),
        foregroundColor: WidgetStateProperty.all<Color?>(colorScheme.onPrimaryContainer),
        shape: WidgetStateProperty.all(RoundedRectangleBorder(borderRadius: MySizes.circleBorderRadius)),
        shadowColor: WidgetStateProperty.all<Color?>(Colors.transparent),
        elevation: WidgetStateProperty.all<double>(0),
        padding: WidgetStateProperty.all<EdgeInsetsGeometry>(const EdgeInsets.symmetric(horizontal: 10, vertical: 0)),
      ),
    );
  }

  OutlinedButtonThemeData outlinedButtonThemeData({required Brightness brightness}) {
    var colorScheme = getCurrentColorScheme(brightness: brightness);
    return OutlinedButtonThemeData(
      style: ButtonStyle(
        textStyle: WidgetStateProperty.all<TextStyle?>(
          getTextTheme(brightness: brightness).labelLarge?.copyWith(
                fontFamily: fontFamily,
                height: 2.3,
              ),
        ),
        foregroundColor: WidgetStateProperty.all<Color?>(colorScheme.primary),
        backgroundColor: WidgetStateProperty.all<Color?>(colorScheme.onPrimary),
        overlayColor: WidgetStateProperty.all<Color?>(colorScheme.onPrimaryContainer.withOpacity(.07)),
        shadowColor: WidgetStateProperty.all<Color?>(Colors.transparent),
        elevation: WidgetStateProperty.all<double>(0),
        minimumSize: WidgetStateProperty.all<Size>(const Size(double.infinity, MySizes.buttonHeight)),
        padding: WidgetStateProperty.all<EdgeInsetsGeometry>(
          const EdgeInsets.symmetric(horizontal: MySizes.defaultPadding),
        ),
        shape: WidgetStateProperty.all<OutlinedBorder>(
          RoundedRectangleBorder(borderRadius: MySizes.circleBorderRadius),
        ),
        side: WidgetStateProperty.all<BorderSide>(BorderSide(color: colorScheme.primary, width: 2)),
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
        textStyle: WidgetStateProperty.all<TextStyle?>(
          getTextTheme(brightness: brightness).labelLarge?.copyWith(
                fontFamily: fontFamily,
                height: 1,
              ),
        ),
        backgroundColor: WidgetStateProperty.resolveWith<Color?>((Set<WidgetState> states) {
          if (states.contains(WidgetState.disabled)) {
            return colorScheme.primary.withOpacity(.5);
          } else {
            return colorScheme.primary;
          }
        }),
        foregroundColor: WidgetStateProperty.all<Color?>(colorScheme.onPrimary),
        elevation: WidgetStateProperty.all<double>(0),
        shadowColor: WidgetStateProperty.all<Color?>(Colors.transparent),
        minimumSize: WidgetStateProperty.all<Size>(const Size(double.infinity, MySizes.buttonHeight)),
        padding: WidgetStateProperty.all<EdgeInsetsGeometry>(
          const EdgeInsets.symmetric(horizontal: MySizes.defaultPadding),
        ),
        shape: WidgetStateProperty.all<OutlinedBorder>(
          RoundedRectangleBorder(borderRadius: MySizes.circleBorderRadius),
        ),
      ),
    );
  }

  SwitchThemeData switchThemeData({required Brightness brightness}) {
    var colorScheme = getCurrentColorScheme(brightness: brightness);
    return SwitchThemeData(
      thumbColor: WidgetStateProperty.resolveWith<Color?>((Set<WidgetState> states) {
        if (states.contains(WidgetState.selected)) {
          return colorScheme.onPrimary;
        } else {
          return colorScheme.onPrimaryContainer;
        }
      }),
      trackColor: WidgetStateProperty.resolveWith<Color?>((Set<WidgetState> states) {
        if (states.contains(WidgetState.selected)) {
          return colorScheme.secondary;
        } else {
          return Colors.transparent;
        }
      }),
      trackOutlineColor: WidgetStateProperty.resolveWith<Color?>((Set<WidgetState> states) {
        if (states.contains(WidgetState.selected)) {
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
