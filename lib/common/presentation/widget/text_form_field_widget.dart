import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:line_icons/line_icons.dart';
import 'package:tanfeth_apps/common/shared/extensions/theme_extensions.dart';
import 'package:tanfeth_apps/common/shared/sizes.dart';


class CustomTextFormField extends StatefulWidget {
  final IconData? prefixIcon;
  final TextEditingController? controller;
  final String? hintText;
  final IconData? suffixIcon;
  final void Function()? suffixOnTap;
  final bool? obscureText;
  final int? maxLine;
  final String? Function(String?)? validator;
  final AutovalidateMode? validateType;
  final TextInputType? keyboardType;
  final bool? readOnly;
  final bool? enabled;
  final void Function(String)? onChanged;
  final void Function(String)? onFieldSubmitted;
  final void Function()? onTap;
  final EdgeInsetsGeometry? contentPadding;
  final List<TextInputFormatter>? inputFormatters;
  final Widget? suffixWidget;
  final Color? fillColor;
  final bool? enableInteractiveSelection;
  final TextInputAction? textInputAction;
  final int? maxLength;

  const CustomTextFormField({
    super.key,
    this.prefixIcon,
    this.controller,
    this.hintText,
    this.suffixIcon,
    this.suffixOnTap,
    this.obscureText,
    this.maxLine,
    this.validator,
    this.validateType,
    this.keyboardType,
    this.readOnly,
    this.enabled,
    this.onChanged,
    this.onFieldSubmitted,
    this.contentPadding,
    this.inputFormatters,
    this.onTap,
    this.suffixWidget,
    this.fillColor,
    this.enableInteractiveSelection,
    this.textInputAction,
    this.maxLength
  });

  @override
  State<CustomTextFormField> createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  final FocusNode _focusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _focusNode.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Opacity(
      opacity: widget.enabled == false ? 0.4 : 1.0,
      child: TextFormField(
        onTapOutside: (event) => FocusScope.of(context).unfocus(),
        controller: widget.controller,
        focusNode: _focusNode,
        keyboardType: widget.keyboardType,
        enabled: widget.enabled,
        onChanged: widget.onChanged,
        onFieldSubmitted: widget.onFieldSubmitted,
        onTap: widget.onTap,
        validator: widget.validator,
        readOnly: widget.readOnly ?? false,
        autovalidateMode: widget.validateType ?? AutovalidateMode.onUserInteraction,
        obscureText: widget.obscureText ?? false,
        // obscuringCharacter: '-',
        maxLines: widget.maxLine ?? 1,
        inputFormatters: widget.inputFormatters,
        maxLength: widget.maxLength,
        textInputAction: widget.textInputAction,
        enableInteractiveSelection: widget.enableInteractiveSelection,
        decoration: InputDecoration(
          hintText: widget.hintText,
          contentPadding: widget.contentPadding,
          counterText: '',
          label: Text(widget.hintText??''),
          labelStyle: context.text.bodySmall?.copyWith(
            color: context.color.onSurface.withOpacity(0.3)
          ),
          fillColor: widget.fillColor,
          prefixIcon: widget.prefixIcon != null
              ? Container(
                  width: MySizes.buttonHeight,
                  height: MySizes.buttonHeight,
                  margin: const EdgeInsetsDirectional.only(start: MySizes.defaultPadding * .25),
                  child: Icon(
                    widget.prefixIcon!,
                    size: MySizes.largePadding * .75,
                    color: _focusNode.hasFocus ? context.color.primary : context.color.onPrimaryContainer,
                  ),
                )
              : null,
          suffixIcon: widget.suffixIcon != null
              ? InkWell(
                  onTap: widget.suffixOnTap,
                  highlightColor: Colors.transparent,
                  splashColor: Colors.transparent,
                  child: Container(
                    width: MySizes.buttonHeight,
                    height: MySizes.buttonHeight,
                    margin: const EdgeInsetsDirectional.only(end: MySizes.defaultPadding * .25),
                    child: Transform.flip(
                      flipX: widget.suffixIcon == LineIcons.search ? true : false,
                      child: Icon(
                        widget.suffixIcon!,
                        size: MySizes.largePadding * .75,
                        color:
                            _focusNode.hasFocus ? context.color.primary : context.color.onPrimaryContainer,
                      ),
                    ),
                  ),
                )
              : widget.suffixWidget,
        ),
        style: context.text.bodyMedium?.copyWith(
          color: context.color.onSurface,
          fontWeight: FontWeight.w500,
          height: widget.maxLine != null ? 1.2 : 2.3,
        ),
      ),
    );
  }
}
