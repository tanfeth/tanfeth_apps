import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tanfeth_apps/common/shared/extensions/theme_extensions.dart';
import 'package:tanfeth_apps/common/shared/images.dart';
import 'package:tanfeth_apps/travel/taxi24/taxi24_driver/shared/helper_methods.dart';


class ProfileDataWidget extends StatelessWidget {
  const ProfileDataWidget({
    Key? key,
    required this.percentNumber,
    required this.title,
  }) : super(key: key);
  final int percentNumber;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: sheetColor(value: percentNumber,context: context).withOpacity(.16),
          border: Border.all(
              color:sheetColor(value: percentNumber,context: context)
                  )),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 6),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Expanded(
                  child: Text(
                    "$percentNumber%",
                    style: context.text.bodyLarge?.copyWith(
                      color: sheetColor(value: percentNumber,context: context),
                    ),
                  ),
                ),
                SvgPicture.asset(
                  Images.accsMarkSVG,
                  height: 16,
                  width: 16,
                ),
              ],
            ),
            SizedBox(
              height: 8,
            ),

            Text(
              title,
            ),
          ],
        ),
      ),
    );
  }
}
