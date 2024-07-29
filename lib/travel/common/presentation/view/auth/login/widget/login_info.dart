

import 'package:flutter/material.dart';
import 'package:api_controller/shared/extensions/padding_extension.dart';
import 'package:api_controller/shared/extensions/theme_extensions.dart';
import 'package:tanfeth_apps/common/shared/languages.dart';

class LoginInfo extends StatelessWidget {
  const LoginInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return   Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          LangEnum.enterMobileNum.tr(),
          style: context.text.titleLarge,
        ),
        10.ph,
        Text(
          LangEnum.enterMobileNumDes.tr(),
          style: context.text.bodyMedium,
        ),
      ],
    );
  }
}
