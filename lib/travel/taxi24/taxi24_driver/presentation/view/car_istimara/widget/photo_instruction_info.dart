import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:api_controller/shared/extensions/theme_extensions.dart';
import 'package:tanfeth_apps/common/shared/images.dart';



class PersonalInstructionInfo extends StatelessWidget {
  const PersonalInstructionInfo(
      {Key? key,
      required this.title,})
      : super(key: key);
  final String title;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SvgPicture.asset(
          Images.checkMarkSVG,
          height: 12,
          width: 16,
        ),

        SizedBox(
          width: 12,
        ),
        Expanded(
          child:Text(
            title,
            maxLines: 5,
            style: TextStyle(
              color: context.color.surfaceContainerHighest
            ),
          ),
        ),
      ],
    );
  }
}
