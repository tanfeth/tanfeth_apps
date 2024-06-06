import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tanfeth_apps/common/shared/extensions/theme_extensions.dart';
import 'package:tanfeth_apps/common/shared/images.dart';


class PhotoSourceItemWidget extends StatelessWidget {
  const PhotoSourceItemWidget({
    Key? key,
    required this.title,
    required this.icon,
    required this.iconWidth,
    required this.iconHeight,
    required this.function,
  }) : super(key: key);
  final String title;
  final String icon;
  final double iconWidth;
  final double iconHeight;
  final VoidCallback function;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: function,
      child: SizedBox(
        height: 56,
        child: Row(
          children: [
            SvgPicture.asset(
              icon,
              width: iconWidth,
              height: iconHeight,
            ),
            SizedBox(
              width: 20,
            ),
            Text(
              title,
              textAlign: TextAlign.start,
              style: context.text.titleMedium,
            ),
          ],
        ),
      ),
    );
  }
}
