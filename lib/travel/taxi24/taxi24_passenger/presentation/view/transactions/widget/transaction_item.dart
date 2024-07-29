import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:api_controller/shared/extensions/padding_extension.dart';
import 'package:api_controller/shared/extensions/theme_extensions.dart';
import 'package:tanfeth_apps/common/shared/images.dart';

class TransactionItem extends StatelessWidget {
  final dynamic transaction;
  const TransactionItem({required this.transaction,super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SvgPicture.asset(transaction['transactionType']=="purchase"?Images.tripCarSVG:Images.plusSVG,width: 48,height: 48,),
        12.pw,
        Expanded(child: Text(transaction['process'],style: context.text.titleSmall,)),
        Text( transaction['amount'],style: context.text.titleSmall,),
      ],
    );;
  }
}
