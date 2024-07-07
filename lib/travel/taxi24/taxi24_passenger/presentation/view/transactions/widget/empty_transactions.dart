import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:tanfeth_apps/common/shared/extensions/padding_extension.dart';
import 'package:tanfeth_apps/common/shared/extensions/theme_extensions.dart';
import 'package:tanfeth_apps/common/shared/images.dart';
import 'package:tanfeth_apps/common/shared/languages.dart';

class EmptyTransactions extends StatelessWidget {
  const EmptyTransactions ({super.key});
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(Images.transactionsSVG, width: 220, height: 155,),
          28.ph,
          Text(LangEnum.noTransaction.tr(),style: context.text.titleMedium,),
          9.ph,
          Text(LangEnum.transactionHint.tr(),style: context.text.bodyMedium?.copyWith(color: context.color.surfaceContainerHighest)),
        ],
      ),
    );
  }
}
