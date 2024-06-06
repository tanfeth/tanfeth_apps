import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:line_icons/line_icons.dart';
import 'package:tanfeth_apps/common/shared/extensions/theme_extensions.dart';
import 'package:tanfeth_apps/common/shared/helper_methods.dart';
import 'package:tanfeth_apps/common/shared/images.dart';
import 'package:tanfeth_apps/common/shared/sizes.dart';


class PhoneFormField extends StatefulWidget {
  final TextEditingController? controller;
  final int? maxLine;
  final String? Function(String?)? validator;
  final AutovalidateMode? validateType;
  final bool? readOnly;
  final bool? enabled;
  final void Function(String)? onChanged;
  final String hintText;
  final bool? hidePrefixIcon;
  final bool? hideCountryCode;


  const PhoneFormField({
    Key? key,
    this.controller,
    this.maxLine,
    this.validator,
    this.validateType,
    this.readOnly,
    this.enabled,
    this.onChanged,
    required this.hintText,
    this.hidePrefixIcon,
    this.hideCountryCode,
  }) : super(key: key);

  @override
  State<PhoneFormField> createState() => _PhoneFormFieldState();
}

class _PhoneFormFieldState extends State<PhoneFormField> {
  final FocusNode _focusNode = FocusNode();

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      openKeyboard(context: context, focusNode: _focusNode);
    });

    _focusNode.addListener(() {
      setState(() {});
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Opacity(
      opacity: widget.enabled == false ? 0.4 : 1.0,
      child: TextFormField(
        onTapOutside: (event) => FocusScope.of(context).unfocus(),
        controller: widget.controller,
        focusNode: _focusNode,
        autofocus: true,
        enabled: widget.enabled,
        onChanged: widget.onChanged,
        validator: widget.validator,
        readOnly: widget.readOnly ?? false,
        keyboardType: TextInputType.phone,
        inputFormatters: [
          FilteringTextInputFormatter.digitsOnly,
          LengthLimitingTextInputFormatter(9),],
        autovalidateMode: widget.validateType ?? AutovalidateMode.onUserInteraction,
        obscureText: false,
        maxLines: widget.maxLine ?? 1,
        decoration: InputDecoration(
          hintText: widget.hintText,
          label: Text(widget.hintText),
          labelStyle: context.text.bodySmall?.copyWith(
              color: context.color.onSurface.withOpacity(0.3)
          ),
          prefixIcon: widget.hidePrefixIcon == null
              ? Container(
                  width: MySizes.buttonHeight,
                  height: MySizes.buttonHeight,
                  margin: const EdgeInsetsDirectional.only(start: MySizes.defaultPadding * .25),
                  child: Icon(
                    LineIcons.phone,
                    size: MySizes.largePadding * .75,
                    color: _focusNode.hasFocus ? context.color.primary : context.color.onPrimaryContainer,
                  ),
                )
              : null,
          suffixIcon: widget.hideCountryCode == null
              ? Container(
                  height: MySizes.buttonHeight,
                  margin: const EdgeInsetsDirectional.only(start: MySizes.defaultPadding * .25),
                  padding: const EdgeInsets.all(MySizes.defaultPadding * .6),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Directionality(
                        textDirection: TextDirection.ltr,
                        child: Transform.translate(
                          offset: const Offset(0, 1.4),
                          child: Text(
                            '+966',
                          ),
                        ),
                      ),
                      const SizedBox(width: MySizes.defaultPadding * .5),
                      SvgPicture.asset(Images.saudiArabiaIconSVG),
                    ],
                  ),
                )
              : null,
        ),
        style: context.text.bodyMedium?.copyWith(
          color: context.color.onSurface,
          fontWeight: FontWeight.w500,
          height: 2.3,
        ),
      ),
    );
  }
}
