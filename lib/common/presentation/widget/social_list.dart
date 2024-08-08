import 'package:api_controller/shared/extensions/padding_extension.dart';
import 'package:api_controller/shared/extensions/theme_extensions.dart';
import 'package:api_controller/shared/helper_methods.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:line_icons/line_icons.dart';
import 'package:tanfeth_apps/common/presentation/widget/social_button.dart';

class SocialRow extends StatelessWidget {
  const SocialRow({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SocialButtonWidget(
          icon: LineIcons.facebookF,
          color: Colors.blue,
          backgroundColor: context.color.primaryContainer,
          onTap: () {},
        ),

        15.pw,
        SocialButtonWidget(
          icon: LineIcons.instagram,
          color: context.color.primary,
          backgroundColor: context.color.primaryContainer,
          onTap: () {},
        ),
        15.pw,

        SocialButtonWidget(
          icon: LineIcons.twitter,
          color: Colors.blue,
          backgroundColor: context.color.primaryContainer,
          onTap: () {},
        ),
        15.pw,




      ],
    );
  }
}
