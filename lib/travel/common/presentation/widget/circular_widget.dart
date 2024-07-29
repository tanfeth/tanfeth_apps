import 'package:flutter/material.dart';
import 'package:api_controller/shared/extensions/theme_extensions.dart';


class CircularWidget extends StatelessWidget {
  const CircularWidget(
      {Key? key,
      required this.color,
      required this.countText,
      required this.progress})
      : super(key: key);
  final Color color;
  final String countText;
  final double progress;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        SizedBox(
          width: 120,
          height: 120,
          child: CircularProgressIndicator(
            color: color,
            value: progress,
            strokeWidth: 4,
          ),
        ),
        Text(
            "$countText%",
            style: context.text.bodyLarge?.copyWith(
              color: color
            ),
        ),

      ],
    );
  }
}
