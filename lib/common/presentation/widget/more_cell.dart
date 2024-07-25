import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:line_icons/line_icons.dart';
import 'package:tanfeth_apps/common/shared/extensions/padding_extension.dart';
import 'package:tanfeth_apps/common/shared/extensions/theme_extensions.dart';
import 'package:tanfeth_apps/common/shared/sizes.dart';
import 'package:tanfeth_apps/common/vm/langauge/langauge_vm.dart';



class MoreCell extends ConsumerWidget {
  final bool isLast;
  final IconData icon;
  final String text;
  final void Function()? onTap;
  final Widget? widget;
  final Color? textColor;

  const MoreCell({
    super.key,
    required this.isLast,
    required this.icon,
    required this.text,
    this.onTap,
    this.widget,
    this.textColor,
  });

  @override
  Widget build(BuildContext context,ref) {
    return InkWell(
      onTap: onTap,
      child: Column(
        children: [
          Padding(
            padding: (
              MySizes.defaultPadding * .85,
              MySizes.largePadding,
            ).toSymmetric,
            child: Row(
              children: [
                Expanded(
                  child: Row(
                    children: [
                      Icon(
                        icon,
                        color:
                            context.color.onPrimaryContainer.withOpacity(0.5),
                        size: MySizes.largePadding * .8,
                      ),
                      10.pw,
                      Padding(
                        padding: (3, 0, 0, 0).toOnly,
                        child: Text(
                          text,
                          style: context.text.bodyMedium?.copyWith(
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                if (widget == null) ...[
                  Icon(
                    ref.watch(languageProvider) == 'ar'
                        ? LineIcons.angleLeft
                        : LineIcons.angleRight,
                    size: MySizes.defaultPadding,
                    color: context.color.onPrimaryContainer.withOpacity(0.5),
                  ),
                ] else ...[
                  widget ?? const SizedBox.shrink(),
                ],
              ],
            ),
          ),
          if (!isLast) ...[
            Padding(
              padding: (MySizes.largePadding).toHorizontal,
              child: Divider(
                height: 1.2,
                thickness: 1.2,
                color: context.color.primaryContainer,
              ),
            ),
          ],
        ],
      ),
    );
  }
}
