import 'package:flutter/material.dart';
import 'package:tanfeth_apps/common/shared/extensions/theme_extensions.dart';
import 'package:tanfeth_apps/common/shared/helper_methods.dart';
import 'package:tanfeth_apps/common/shared/sizes.dart';


class CloseBottomSheetWidget extends StatelessWidget {
  const CloseBottomSheetWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => closeBottomSheet(),
      child: Container(
        width: MySizes.largePadding * 1.5,
        height: 5,
        decoration: BoxDecoration(
          color: context.color.onPrimaryContainer.withOpacity(.3),
          borderRadius: MySizes.circleBorderRadius,
        ),
      ),
    );
  }
}
