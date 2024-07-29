import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:line_icons/line_icons.dart';
import 'package:tanfeth_apps/common/shared/extensions/padding_extension.dart';
import 'package:tanfeth_apps/common/shared/extensions/theme_extensions.dart';
import 'package:api_controller/shared/sizes.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:api_controller/vm/langauge/langauge_vm.dart';


class BackButtonWidget extends ConsumerWidget {
  final void Function()? onTap;
  final Color? bgColor;
  final Color? iconColor;

  const BackButtonWidget(
      {super.key, this.onTap, this.bgColor, this.iconColor});

  @override
  Widget build(BuildContext context,ref) {
    return Padding(
      padding: (0, 0, MySizes.largePadding, 0).toOnly,
      child: InkWell(
        onTap: onTap ?? () => Get.back(),
        child: CircleAvatar(
          radius: 20,
          backgroundColor: bgColor ?? context.color.primaryContainer,
          child: Icon(
            ref.read(languageProvider) == 'ar'
                ? LineIcons.arrowRight
                : LineIcons.arrowLeft,
            color: iconColor ?? context.color.onPrimaryContainer,
            size: 20,
          ),
        ),
      ),
    );
  }
}
