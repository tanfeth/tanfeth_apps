import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tanfeth_apps/common/shared/extensions/theme_extensions.dart';
import 'package:tanfeth_apps/common/shared/images.dart';


class CurrentLocationDetector  extends StatelessWidget {
  final VoidCallback onTap;
  const CurrentLocationDetector ({required this.onTap,Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 12.0,vertical: 16.0),
      child: InkWell(
        onTap: onTap,
        child: Container(
          width: 48,
          height: 48,
          alignment: Alignment.center,
          decoration: BoxDecoration(
              color:context.color.surface,
            borderRadius: BorderRadius.circular(48),
              boxShadow: [
                BoxShadow(
                  color:context.color.surfaceContainerHighest.withOpacity(0.4),
                  blurRadius: 24,
                  offset: const Offset(0, 4), // changes position of shadow
                ),
              ]
          ),
          child:SvgPicture.asset(
            Images.locationDetectorSVG,
            width: 20,
            height: 20,
            colorFilter: ColorFilter.mode(
                context.color.onSurface,
                BlendMode.srcIn),
          )
        ),
      ),
    );
  }
}
