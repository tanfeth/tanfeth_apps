import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:api_controller/shared/extensions/theme_extensions.dart';
import 'package:tanfeth_apps/common/shared/images.dart';


class WarningWidget extends StatelessWidget {
  const WarningWidget(
      {super.key,
      required this.color,
      required this.borderColor,
      required this.title});
  final Color color;
  final Color borderColor;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 92,
      width: 327,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: color,
          border: Border.all(color: borderColor)),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 6),
        child: Row(
          children: [
            SvgPicture.asset(
              Images.accsMarkSVG,
              height: 18,
              width: 18,
            ),
            const SizedBox(
              width: 14,
            ),
            Expanded(
              child: Text(
                title,
                textAlign: TextAlign.start,
                style: context.text.headlineMedium,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
