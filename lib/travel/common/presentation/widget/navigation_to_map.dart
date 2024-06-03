
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:tanfeth_apps/common/shared/extensions/padding_extension.dart';
import 'package:tanfeth_apps/common/shared/extensions/theme_extensions.dart';
import 'package:tanfeth_apps/common/shared/images.dart';
import 'package:tanfeth_apps/common/shared/languages.dart';


class NavigationToMap  extends StatelessWidget {
   final VoidCallback  navigationTap;
   const NavigationToMap ({required this.navigationTap,Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: navigationTap,
      child: Container(
        height: 48,
        width: 143,
        margin: EdgeInsets.symmetric(horizontal: 24,vertical: 16),
        padding: EdgeInsets.symmetric(horizontal: 24),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(40),
            color: context.color.tertiaryContainer,
            boxShadow: [
              BoxShadow(
                color: context.color.surfaceContainerHighest,
                blurRadius: 24,
                offset: const Offset(0, 4), // changes position of shadow
              ),]
        ),
        child: Row(
          children: [
            SvgPicture.asset(
              Images.navigationArrowSVG,
                colorFilter:ColorFilter.mode(
                    context.color.surface,
                    BlendMode.srcIn),
                height: 24,width: 24
            ),

            8.pw,
            Text(
              LangEnum.navigate.tr(),
               style: context.textTheme.bodyMedium,
            ),
          ],
        ),
      ),
    );
  }
}
