import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:api_controller/shared/extensions/theme_extensions.dart';
import 'package:tanfeth_apps/common/shared/images.dart';


class SingleIconNavItemWidget extends StatelessWidget {
  final String icon;
  final String title;
  final bool hasArrow;
  final VoidCallback function;
  final double iconWidth;
  final double iconHeight;

  const SingleIconNavItemWidget(
      {Key? key,
      required this.title,
      required this.icon,
      required this.hasArrow,
      required this.function,
      required this.iconWidth,
      required this.iconHeight})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: function,
      child: SizedBox(
        height: 64,
        child: Row(
          children: [

            Expanded(
              child: Row(
                children: [
                  SvgPicture.asset(
                    icon,
                    width: iconWidth,
                    height: iconHeight,
                    colorFilter:ColorFilter.mode(
                        icon != Images.deleteIconSVG?
                      context.color.onSurface:
                        context.color.error,
                        BlendMode.srcIn
                    ) ,
                  ),

                  SizedBox(
                    width: 12,
                  ),
                  Text(
                    title,
                    style: context.text.titleSmall?.copyWith(
                      color: context.color.onSurface
                    ),
                  ),
                ],
              ),
            ),

            if (hasArrow)
              SvgPicture.asset(
                Images.arrowSVG,
                width: 24,
                height: 24,
              )
          ],
        ),
      ),
    );
  }
}
