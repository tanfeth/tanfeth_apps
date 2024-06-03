import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tanfeth_apps/common/shared/extensions/theme_extensions.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tanfeth_apps/common/shared/images.dart';
import 'package:tanfeth_apps/common/vm/langauge/langauge_vm.dart';

class ProfileItemWidget extends ConsumerWidget {
  const ProfileItemWidget({Key? key,
      required this.title,
      required this.icon,
      required this.function}) : super(key: key);
  final String icon;
  final String title;
  final VoidCallback function;

  @override
  Widget build(BuildContext context,ref) {
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: function,
      child: SizedBox(
        height: 64,
        child: Row(
          children: [
            Expanded(
              child: Row(
                children: [
                  SvgPicture.asset(
                    icon,
                    width: 48,
                    height: 48,
                  ),
                  SizedBox(width: 12,),
                  Text(
                    title,
                    style: context.text.titleSmall,
                  ),
                ],
              ),
            ),

            SvgPicture.asset(
              ref.watch(languageProvider) == 'en'?
              Images.arrowSVG:Images.arrowLeftSVG,
              width: 24,
              height: 24,
            )
          ],
        ),
      ),
    );
  }
}
