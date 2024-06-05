import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:tanfeth_apps/common/shared/extensions/theme_extensions.dart';
import 'package:tanfeth_apps/common/shared/sizes.dart';

class ShimmerWidget extends StatelessWidget {
  final BorderRadius? borderRadius;
  final double? width;
  final double? height;

  const ShimmerWidget({Key? key, this.borderRadius, this.width, this.height}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: context.color.onSurface,
      highlightColor: const Color(0xFFF8F8F8),
      period: const Duration(milliseconds: 1000),
      direction: ShimmerDirection.rtl,
      child: Container(
        width: width ?? double.infinity,
        height: height ?? double.infinity,
        decoration: BoxDecoration(
          borderRadius: borderRadius ?? MySizes.borderRadius,
          color: const Color(0xFFffffff),
        ),
      ),
    );
  }
}
