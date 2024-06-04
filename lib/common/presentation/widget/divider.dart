

import 'package:flutter/material.dart';
import 'package:tanfeth_apps/common/shared/extensions/theme_extensions.dart';
import 'package:tanfeth_apps/common/shared/sizes.dart';

class LargeDivider extends StatelessWidget {
  const LargeDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return Divider(
      height: MySizes.defaultPadding * .4,
      thickness: MySizes.defaultPadding * .4,
      color: context.color.primaryContainer,
    );
  }
}

