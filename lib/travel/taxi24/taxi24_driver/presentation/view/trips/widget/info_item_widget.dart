import 'package:flutter/material.dart';


class InfoItemWidget extends StatelessWidget {
  const InfoItemWidget({super.key, required this.title, required this.value});
final String title;
final String value;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 56,
      child: Row(children: [
        Expanded(child:
            Text(
              title,
                textAlign: TextAlign.start
            ),),

        Text(
          value,
        ),
      ],),
    );
  }
}
