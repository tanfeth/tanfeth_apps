import 'package:flutter/material.dart';
import 'package:api_controller/presentation/widget/shimmer_widget.dart';
import 'package:api_controller/shared/extensions/theme_extensions.dart';
import 'package:api_controller/shared/sizes.dart';


class PriceCell extends StatelessWidget {
  final String title;
  final String value;
  final Color? textColor;
  final bool? isLoading;

  const PriceCell({
    super.key,
    required this.title,
    required this.value,
    this.textColor,
    this.isLoading,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Text(
            title,
            style: context.text.bodySmall?.copyWith(
              color: textColor ?? context.color.onSurface,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        isLoading == true
            ? const ShimmerWidget(width: MySizes.buttonHeight * 1.3,
            height: MySizes.defaultPadding * 0.8)
            : Text(
                value,
                style: context.text.bodySmall?.copyWith(
                  color: textColor ?? context.color.onSurface,
                  fontWeight: FontWeight.w700,
                ),
              ),
      ],
    );
  }
}
