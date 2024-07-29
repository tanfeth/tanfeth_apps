import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:line_icons/line_icons.dart';
import 'package:tanfeth_apps/common/shared/extensions/padding_extension.dart';
import 'package:tanfeth_apps/common/shared/extensions/theme_extensions.dart';
import 'package:api_controller/shared/sizes.dart';


class DropDownWidget<T> extends StatelessWidget {
  final String hintText;
  final IconData? prefixIcon;
  final List<DropdownMenuItem<T>> items;
  final String? Function(T?)? validator;
  final T? value;
  final void Function(T?)? onChanged;

  const DropDownWidget({
    super.key,
    required this.hintText,
    this.prefixIcon,
    required this.items,
    this.validator,
    this.value,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: context.theme.copyWith(
        canvasColor: context.color.surface,
        buttonTheme: context.theme.buttonTheme.copyWith(
          alignedDropdown: true,
        ),
      ),
      child: DropdownButtonFormField<T>(
        items: items,
        validator: validator,
        value: value,
        onChanged: onChanged,
        icon: const SizedBox.shrink(),
        isExpanded: true,
        borderRadius: MySizes.borderRadius,
        style: context.text.bodyMedium?.copyWith(
          color: context.color.onSurface,
          fontWeight: FontWeight.w500,
          height: 1.8,
        ),
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: context.text.bodyMedium?.copyWith(
            color: context.color.onPrimaryContainer,
            fontWeight: FontWeight.w500,
            height: 1.8,
          ),
          prefixIcon: prefixIcon != null
              ? Container(
                  width: MySizes.buttonHeight,
                  height: MySizes.buttonHeight,
                  margin: const EdgeInsetsDirectional.only(start: MySizes.defaultPadding * .25),
                  child: Icon(
                    prefixIcon,
                    size: MySizes.largePadding * .75,
                    color: context.color.onPrimaryContainer,
                  ),
                )
              : null,
          suffixIcon: Container(
            width: MySizes.buttonHeight,
            height: MySizes.buttonHeight,
            margin: const EdgeInsetsDirectional.only(end: MySizes.defaultPadding * .25),
            child: Icon(
              LineIcons.angleDown,
              size: MySizes.largePadding * .5,
              color: context.color.onPrimaryContainer,
            ),
          ),
          contentPadding: value != null ? (10, 13).toSymmetric : (10, 30).toSymmetric,
        ),
      ),
    );
  }
}
