import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tanfeth_apps/common/shared/extensions/button_extensions.dart';
import 'package:tanfeth_apps/common/shared/extensions/theme_extensions.dart';
import 'package:tanfeth_apps/common/shared/sizes.dart';

class AuthLinkedMsg extends StatelessWidget {
  final String? message;
  final String? linkTitle;
  final void Function()? onPressed;

  const AuthLinkedMsg({super.key, this.message, this.linkTitle, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        height: MySizes.largePadding,
        child: TextButton(
          onPressed: onPressed,
          style: const ButtonStyle().DarkTextButton(context),
          child: Transform.translate(
            offset: const Offset(0, 2),
            child: RichText(
              textAlign: TextAlign.center,
              text: TextSpan(
                text: '$message ',
                style: context.textTheme.bodyMedium?.copyWith(
                  fontWeight: FontWeight.w600,
                  fontSize: 13,
                ),
                children: <TextSpan>[
                  TextSpan(
                    text: linkTitle,
                    style: context.textTheme.bodyMedium?.copyWith(
                      color: context.color.primary,
                      fontWeight: FontWeight.w600,
                      fontSize: 13,
                      // decoration: TextDecoration.underline,
                      // decorationColor: context.color.primary,
                      // decorationThickness: 6,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
