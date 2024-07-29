

import 'package:flutter/material.dart';
import 'package:api_controller/shared/extensions/padding_extension.dart';
import 'package:api_controller/shared/extensions/theme_extensions.dart';
import 'package:tanfeth_apps/common/shared/languages.dart';

class AppVersion extends StatelessWidget {
 final  String version;
  const AppVersion({super.key , required this.version});

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
            version,
            style: context.text.bodySmall?.copyWith(color: context.color.onPrimaryContainer),
          ),
        ],
      ),
    );
  }
}
