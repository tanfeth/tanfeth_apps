import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:api_controller/shared/extensions/theme_extensions.dart';
import 'package:tanfeth_apps/common/shared/images.dart';



class LogOutWidget extends StatelessWidget {
  final String title;
  final VoidCallback function;
  
  const LogOutWidget(
      {Key? key,
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
            SvgPicture.asset(
              Images.logOutSVG,
              width: 17,
              height: 17,
              colorFilter: ColorFilter.mode(
                  context.color.error,
                  BlendMode.srcIn),
            ),

            SizedBox(width: 20,),

            Text(
              title,
              textAlign: TextAlign.start,
              style: context.text.titleMedium?.copyWith(
                color: context.color.error
              ),
            ),
          ],
        ),
      ),
    );
  }
}
