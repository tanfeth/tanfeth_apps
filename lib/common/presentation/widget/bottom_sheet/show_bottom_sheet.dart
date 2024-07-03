import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tanfeth_apps/common/shared/sizes.dart';

showBottomSheetFunction({required Widget content,
  bool isDismissible = true}) => Get.bottomSheet(
    content,
    useRootNavigator: true,
    isDismissible: isDismissible,
    elevation: 0,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(MySizes.circleRadius),
        topRight: Radius.circular(MySizes.circleRadius),
      ),
    ),
    isScrollControlled: true,
    backgroundColor: Get.theme.colorScheme.background,
    barrierColor: Colors.black.withOpacity(0.6),
  );
