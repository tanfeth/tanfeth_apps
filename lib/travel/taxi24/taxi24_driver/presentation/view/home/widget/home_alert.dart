import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tanfeth_apps/common/shared/extensions/theme_extensions.dart';
import 'package:tanfeth_apps/common/shared/images.dart';


class Alert extends StatelessWidget {
  final Color bodyColor;
  final Color borderColor;
  final String text;
  final String buttonText;
  final VoidCallback? buttonFunction;
  
  
   Alert({
    required this.bodyColor,
    required this.borderColor,
    required this.text,
    required this.buttonText,
     this.buttonFunction,
    Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Container(
      margin: EdgeInsets.symmetric(horizontal: 24, vertical:16),
      decoration: BoxDecoration(
          color: bodyColor,
          borderRadius: BorderRadius.all(Radius.circular(8)),
          border: Border.all(color: borderColor,width: 2)
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.all(16),
            child:  SvgPicture.asset(
              Images.alertIconSVG
            ),
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 14,),
                Text(
                    text,
                  style: TextStyle(),
                  maxLines: 5,
                  textAlign: TextAlign.start,
                ),

                SizedBox(height: 8,),
                GestureDetector(
                  behavior: HitTestBehavior.translucent,
                  onTap: buttonFunction,
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal:  16, vertical:8),
                    decoration: BoxDecoration(
                        color: context.color.onSurface,
                        borderRadius: BorderRadius.all(Radius.circular(38))
                    ),
                    child:Text(buttonText),
                  ),
                ),
                SizedBox(height: 16,),
              ],
            ),
          )
        ],
      ),
    );
  }
}
