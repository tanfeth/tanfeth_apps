import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:tanfeth_apps/common/shared/extensions/theme_extensions.dart';
import 'package:tanfeth_apps/common/shared/sizes.dart';

class ShimmerWidget extends StatelessWidget {
  final BorderRadius? borderRadius;
  final double? width;
  final double? height;
  final Widget? child;

  const ShimmerWidget({super.key, this.borderRadius,
    this.width, this.height,this.child});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: context.color.surfaceContainerHighest.
      withOpacity(0.2),
      highlightColor: context.color.surface,
      period: const Duration(milliseconds: 1000),
      direction: ShimmerDirection.rtl,
      child: child??
      Container(
        width: width ?? double.infinity,
        height: height ?? double.infinity,
        decoration: BoxDecoration(
          borderRadius: borderRadius ?? MySizes.borderRadius,
          color: context.color.surfaceContainerHighest,
        ),
      ),
    );
  }
}
