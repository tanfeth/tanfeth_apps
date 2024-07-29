import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:api_controller/shared/extensions/padding_extension.dart';
import 'package:api_controller/shared/extensions/theme_extensions.dart';
import 'package:tanfeth_apps/common/shared/images.dart';

class RateWidget extends StatelessWidget {
  final double rateValue;
  const RateWidget({super.key,required this.rateValue});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 32,
      padding: 10.toHorizontal,
      decoration: BoxDecoration(color: context.color.primaryContainer,
          borderRadius: BorderRadius.circular(38),
          boxShadow:[] ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(Images.kStarSVG, width: 16, height: 16,color: context.color.onSurface,),
          SizedBox(width: 6,),
          Text('${rateValue}', style: context.text.bodyLarge,),
        ],
      ),
    );
  }
}
