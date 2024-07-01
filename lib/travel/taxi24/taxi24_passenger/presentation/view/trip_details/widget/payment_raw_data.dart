import 'package:flutter/material.dart';

class PaymentRawData extends StatelessWidget {
  final String title;
  final String value;
  const PaymentRawData({super.key, required this.title, required this.value});

  @override
  Widget build(BuildContext context) {
    return  Row(
      children: [
        Text(title,),
        Spacer(),
        Text(value),
      ],
    );
  }
}
