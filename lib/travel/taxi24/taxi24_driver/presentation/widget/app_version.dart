

import 'package:flutter/material.dart';
import 'package:tanfeth_apps/common/shared/extensions/padding_extension.dart';
import 'package:tanfeth_apps/common/shared/extensions/theme_extensions.dart';
import 'package:tanfeth_apps/common/shared/languages.dart';

class AppVersion extends StatelessWidget {
  const AppVersion({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            LangEnum.appVersion.tr(),
            style: context.text.bodySmall?.copyWith(color: context.color.onPrimaryContainer),
          ),
          20.pw,
          Text(
            '0.1.2',
            style: context.text.bodySmall?.copyWith(color: context.color.onPrimaryContainer),
          ),
        ],
      ),
    );
  }
}
