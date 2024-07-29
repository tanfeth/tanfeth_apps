import 'package:flutter/material.dart';
import 'package:api_controller/shared/extensions/theme_extensions.dart';


class AnalyticsRow extends StatelessWidget {
  final String title ;
  final String price ;
  final Color ?colorPrice ;

  const AnalyticsRow({
    required this.title,
    required this.price,
     this.colorPrice,
    Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Text(
            title,
            textAlign: TextAlign.start,
          ),
        ),

        Text(
          price,
          textAlign: TextAlign.start,
          style: TextStyle(
            color: colorPrice??context.color.onSurface
          ),
        ),
      ],
    );
  }
}
