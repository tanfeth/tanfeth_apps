import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:api_controller/shared/extensions/padding_extension.dart';
import 'package:api_controller/shared/extensions/theme_extensions.dart';
import 'package:tanfeth_apps/common/shared/images.dart';

class RawData extends StatelessWidget {
  final String icon;
  final String text;
  const RawData({super.key , required this.text,required this.icon});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SvgPicture.asset(icon, width: 20, height: 20),
        16.pw,
        Text(text,style: context.text.bodyMedium,),
      ],
    );
  }
}
