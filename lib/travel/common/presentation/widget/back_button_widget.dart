import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:line_icons/line_icons.dart';
import 'package:api_controller/shared/extensions/padding_extension.dart';
import 'package:api_controller/shared/extensions/theme_extensions.dart';
import 'package:api_controller/shared/sizes.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:api_controller/vm/langauge/langauge_vm.dart';


class BackButtonWidget extends ConsumerWidget {
  final void Function()? onTap;
  final Color? bgColor;
  final Color? iconColor;
  final IconData? icon;

  const BackButtonWidget(
      {super.key, this.onTap, this.bgColor, this.iconColor,
      this.icon});

  @override
  Widget build(BuildContext context,ref) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: InkWell(
        splashColor: context.color.surface,
        onTap: onTap ?? () => Get.back(),
        child: CircleAvatar(
          radius: 20,
          backgroundColor: bgColor ?? context.color.onSurface,
          child: Icon(
              icon ?? (ref.read(languageProvider) == 'ar'
                ? LineIcons.arrowRight
                : LineIcons.arrowLeft),
            color: iconColor ?? context.color.surface,
            size: 20,
          ),
        ),
      ),
    );
  }
}
