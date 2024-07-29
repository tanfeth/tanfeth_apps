import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:api_controller/shared/extensions/theme_extensions.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tanfeth_apps/common/shared/images.dart';
import 'package:api_controller/vm/langauge/langauge_vm.dart';

class ProfileCell extends ConsumerWidget {
  final String icon;
  final String title;
  final VoidCallback function;
  final Widget? imageWidget;
  final double? iconHeight;
  final double? iconWidth;
  final double? height;

  const ProfileCell(
      {Key? key,
      required this.title,
      this.icon = '',
      required this.function,
      this.imageWidget,
      this.iconHeight,
      this.iconWidth,
      this.height,
      })
      : super(key: key);

  @override
  Widget build(BuildContext context, ref) {
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: function,
      child: SizedBox(
        height:height?? 64,
        child: Row(
          children: [
            Expanded(
              child: Row(
                children: [
                  if (imageWidget != null) ...[imageWidget ?? const SizedBox.shrink()
                  ] else ...[
                    icon.isNotEmpty
                        ? SvgPicture.asset(
                            icon,
                            width: iconWidth??48,
                            height: iconHeight??48,
                          )
                        : const SizedBox.shrink(),
                  ],
                  SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: Text(
                      title,
                      style: context.text.titleSmall,
                    ),
                  ),
                ],
              ),
            ),
            SvgPicture.asset(
              ref.watch(languageProvider) == 'en' ? Images.arrowSVG : Images.arrowLeftSVG,
              width: 24,
              height: 24,
            )
          ],
        ),
      ),
    );
  }
}
