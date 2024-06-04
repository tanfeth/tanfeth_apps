import 'package:flutter/material.dart';
import 'package:tanfeth_apps/common/shared/extensions/theme_extensions.dart';
import 'package:tanfeth_apps/common/shared/sizes.dart';


class SmallDivider extends StatelessWidget {
  const SmallDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return Divider(
      height: MySizes.defaultPadding * .1,
      thickness: MySizes.defaultPadding * .1,
      color: context.color.primaryContainer,
    );
  }
}
