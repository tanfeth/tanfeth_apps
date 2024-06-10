import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tanfeth_apps/common/shared/extensions/theme_extensions.dart';
import 'package:tanfeth_apps/common/shared/images.dart';


class HelpDriverItemWidget extends StatelessWidget {
  final String title;
  final VoidCallback function;
  
  
  const HelpDriverItemWidget({Key? key,
      required this.title,
      required this.function})
      : super(key: key);


  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: function,
      child: SizedBox(
        height: 56,
        child: Row(
          children: [
            Expanded(
              child: Text(
                title,
                textAlign: TextAlign.start,
                style: context.text.titleMedium,
              ),
            ),

            SvgPicture.asset(
              Images.routeToSVG,
              width: 18,
              height: 18,
            ),
          ],
        ),
      ),
    );
  }
}
