import 'package:flutter/material.dart';
import 'package:tanfeth_apps/common/shared/extensions/theme_extensions.dart';
import 'package:api_controller/shared/sizes.dart';

extension ElevatedButtonEx on ButtonStyle {
  ButtonStyle? SecondaryElevatedButton(BuildContext context) {
    return copyWith(
      foregroundColor: WidgetStateProperty.all<Color?>(context.color.onSecondary),
      backgroundColor: WidgetStateProperty.resolveWith<Color?>((Set<WidgetState> states) {
        if (states.contains(WidgetState.disabled)) {
          return context.color.secondary.withOpacity(.5);
        } else {
          return context.color.secondary;
        }
      }),
    );
  }

  ButtonStyle? GreyElevatedButton(BuildContext context) {
    return copyWith(
      foregroundColor: WidgetStateProperty.all<Color?>(context.color.onPrimaryContainer),
      backgroundColor: WidgetStateProperty.all<Color?>(context.color.primaryContainer),
    );
  }

  ButtonStyle? OutlineElevatedButton(BuildContext context) {
    return copyWith(
      foregroundColor: WidgetStateProperty.all<Color?>(context.color.onPrimaryContainer),
      backgroundColor: WidgetStateProperty.all<Color?>(context.color.primaryContainer),
    );
  }

  ButtonStyle? DarkGreyElevatedButton(BuildContext context) {
    return copyWith(
      foregroundColor: WidgetStateProperty.all<Color?>(context.color.onSecondary),
      backgroundColor: WidgetStateProperty.all<Color?>(context.color.onPrimaryContainer),
    );
  }

  ButtonStyle? MinElevatedButton(BuildContext context) {
    return copyWith(
      minimumSize: const WidgetStatePropertyAll(Size.zero),
      padding: const WidgetStatePropertyAll(EdgeInsets.symmetric(horizontal: MySizes.defaultPadding)),
    );
  }

  ButtonStyle? MinErrorElevatedButton(BuildContext context) {
    return copyWith(
      overlayColor: WidgetStateProperty.all<Color?>(context.color.error),
      backgroundColor: WidgetStateProperty.all<Color?>(context.color.error),
      minimumSize: const WidgetStatePropertyAll(Size.zero),
      padding: const WidgetStatePropertyAll(EdgeInsets.symmetric(horizontal: MySizes.defaultPadding)),
    );
  }

  ButtonStyle? SurfaceElevatedButton(BuildContext context) {
    return copyWith(
      foregroundColor: WidgetStateProperty.all<Color?>(context.color.surface),
      backgroundColor: WidgetStateProperty.all<Color?>(context.color.onSurface),
    );
  }


}

extension OutlinedButtonEx on ButtonStyle {
  ButtonStyle? GreyOutlinedButton(BuildContext context) {
    return copyWith(
      foregroundColor: WidgetStateProperty.all<Color?>(context.color.onPrimaryContainer),
      backgroundColor: WidgetStateProperty.all<Color?>(context.color.onPrimary),
      side: WidgetStateProperty.all<BorderSide>(BorderSide(color: context.color.outline, width: 2)),
    );
  }

  ButtonStyle? OnBackOutlinedButton(BuildContext context) {
    return copyWith(
      foregroundColor: WidgetStateProperty.all<Color?>(context.color.onPrimaryContainer),
      backgroundColor: WidgetStateProperty.all<Color?>(context.color.onPrimary),
     // side: WidgetStateProperty.all<BorderSide>(BorderSide(color: context.color.outline, width: 2)),
    );
  }

  ButtonStyle? DarkTextButton(BuildContext context) {
    return copyWith(
      foregroundColor: WidgetStateProperty.all<Color?>(context.color.onSurface),
      overlayColor: WidgetStateProperty.all<Color?>(context.color.onPrimaryContainer.withOpacity(.05)),
    );
  }



}

extension TextButtonEx on ButtonStyle {
  ButtonStyle? BlackTextButton(BuildContext context) {
    return copyWith(
      foregroundColor: WidgetStateProperty.all<Color?>(context.color.onSurface),
      overlayColor: WidgetStateProperty.all<Color?>(context.color.onPrimaryContainer.withOpacity(.05)),
    );
  }
}


extension SecondaryElevatedButton on ButtonStyle {
  ButtonStyle? secondaryElevatedButton(BuildContext context) {
    return copyWith(
      foregroundColor: WidgetStateProperty.all<Color?>(context.color.onSecondary),
      backgroundColor: WidgetStateProperty.all<Color?>(context.color.secondary),
      overlayColor: WidgetStateProperty.all<Color?>(context.color.onSecondary.withOpacity(.1)),
    );
  }
}

