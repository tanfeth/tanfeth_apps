import 'package:api_controller/shared/extensions/padding_extension.dart';
import 'package:api_controller/shared/extensions/theme_extensions.dart';
import 'package:api_controller/shared/helper_methods.dart';
import 'package:flutter/material.dart';
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
          onTap: () {
            Uri uri = Uri.parse("https://www.facebook.com/");
            urlLauncher(uri);


          },
        ),

        15.pw,
        SocialButtonWidget(
          icon: LineIcons.instagram,
          color: context.color.primary,
          backgroundColor: context.color.primaryContainer,
          onTap: () {
            Uri uri = Uri.parse("https://www.instagram.com/");
            urlLauncher(uri);

          },
        ),
        15.pw,

        SocialButtonWidget(
          icon: LineIcons.twitter,
          color: Colors.blue,
          backgroundColor: context.color.primaryContainer,
          onTap: () {
            Uri uri = Uri.parse("https://x.com/home");
            urlLauncher(uri);
          },
        ),
        15.pw,




      ],
    );
  }
}
