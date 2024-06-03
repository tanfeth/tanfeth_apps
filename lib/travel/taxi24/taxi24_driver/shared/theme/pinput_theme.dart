import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pinput/pinput.dart';
import 'package:tanfeth_apps/common/shared/sizes.dart';


final pinPutTheme = PinTheme(
  width: MySizes.largePadding * 1.7,
  height: MySizes.largePadding * 2,
  textStyle: Get.theme.textTheme.titleLarge?.copyWith(
    color: Get.theme.colorScheme.primary,
    height: 3,
  ),
  decoration: BoxDecoration(
    borderRadius: BorderRadius.circular(10),
    color: Get.theme.colorScheme.surface,
    border: Border.all(width: 1.5, color: Get.theme.colorScheme.primaryContainer),
  ),
);

final focusedPinTheme = pinPutTheme.copyWith(
  textStyle: Get.theme.textTheme.titleLarge?.copyWith(
    color: Get.theme.colorScheme.primary,
    height: 3,
  ),
  decoration: pinPutTheme.decoration?.copyWith(
    color: Get.theme.colorScheme.surface,
    border: Border.all(width: 1.5, color: Get.theme.colorScheme.primary),
  ),
);

final submittedPinTheme = pinPutTheme.copyWith(
  decoration: pinPutTheme.decoration?.copyWith(
    color: Get.theme.colorScheme.surface,
    border: Border.all(width: 1.5, color: Get.theme.colorScheme.primaryContainer),
  ),
);
