import 'package:flutter/material.dart';
import 'package:api_controller/shared/extensions/theme_extensions.dart';
import 'package:tanfeth_apps/travel/common/presentation/widget/circle.dart';


class CustomRadioWidget extends StatelessWidget {
  const CustomRadioWidget({Key? key, required this.value}) : super(key: key);
  final bool value;

  @override
  Widget build(BuildContext context) {
    return value == true
        ? Stack(
            alignment: AlignmentDirectional.center,
            children: [
              CircleWidget(
                  width: 20, height: 20,
                  color:context.color.primary),
              CircleWidget(
                  width: 6, height: 6,
                  color:context.color.onSurface),
            ],
          )
        : Container(
            width: 20,
            height: 20,
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: context.color.surfaceContainerHighest,
                )),
          );
  }
}
