import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';
import 'package:tanfeth_apps/common/shared/sizes.dart';


PinTheme nitroPinPutTheme(BuildContext context) {
  return PinTheme(
    width: MySizes.largePadding * 1.9,
    height: MySizes.largePadding * 2.15,
    textStyle: Theme.of(context).textTheme.titleLarge?.copyWith(
      color: Theme.of(context).colorScheme.onBackground,
      height: 3.1,
    ),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.zero,
      color: Theme.of(context).colorScheme.background,
      border: Border(
        bottom: BorderSide(width: 1.5, color: Theme.of(context).colorScheme.outline),
      ),
    ),
  );
}

PinTheme nitroFocusedPinTheme(BuildContext context) {
  return nitroPinPutTheme(context).copyWith(
    textStyle: Theme.of(context).textTheme.titleLarge?.copyWith(
      color: Theme.of(context).colorScheme.onBackground,
      height: 3.1,
    ),
    decoration: nitroPinPutTheme(context).decoration?.copyWith(
          color: Theme.of(context).colorScheme.background,
          border: Border(
            bottom: BorderSide(width: 2, color: Theme.of(context).colorScheme.primary),
          ),
        ),
  );
}

PinTheme nitroSubmittedPinTheme(BuildContext context) {
  return nitroPinPutTheme(context).copyWith(
    decoration: nitroPinPutTheme(context).decoration?.copyWith(
          color: Theme.of(context).colorScheme.background,
          border: Border(
            bottom: BorderSide(width: 2, color: Theme.of(context).colorScheme.outline),
          ),
        ),
  );
}
