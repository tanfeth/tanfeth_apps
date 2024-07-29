import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:api_controller/shared/extensions/theme_extensions.dart';
import 'package:tanfeth_apps/common/shared/images.dart';
import 'package:tanfeth_apps/common/shared/languages.dart';



class TripCell extends StatelessWidget {
  final String status;
  final String title;
  final String time;
  final double cost;
  final VoidCallback function;
  
  
  const TripCell(
      {Key? key,
      required this.title,
      required this.status,
      required this.time,
      required this.cost,
      required this.function})
      : super(key: key);


  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: function,
      child: SizedBox(
        height: 92,
        child: Row(
          children: [
            Expanded(
              child: Row(
                children: [
                  SvgPicture.asset(
                    Images.tripCarSVG,
                    width: 48,
                    height: 48,
                  ),

                  SizedBox(width: 12,),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        style: context.text.bodyMedium,
                      ),
                      SizedBox(
                        height: 8,
                      ),

                      Text(
                        LangEnum.sar.tr()+"$cost - $status",
                          style: TextStyle(
                            color: context.color.surfaceContainerHighest
                          ),
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      Text(
                        time,
                        style: TextStyle(
                            color: context.color.surfaceContainerHighest
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),

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
