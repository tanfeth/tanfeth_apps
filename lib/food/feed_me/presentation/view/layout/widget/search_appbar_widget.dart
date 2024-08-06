import 'package:api_controller/shared/extensions/padding_extension.dart';
import 'package:api_controller/shared/extensions/theme_extensions.dart';
import 'package:api_controller/shared/sizes.dart';
import 'package:api_controller/vm/langauge/langauge_vm.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:line_icons/line_icons.dart';


class AppbarSearch extends ConsumerWidget{
  const AppbarSearch({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: (0, 0, 0, 0).toOnly,
      child: InkWell(
        //  onTap: () => Get.toNamed(SearchRouting.config().path),
          highlightColor: Colors.transparent,
          splashColor: Colors.transparent,
          child: Container(
            width: MySizes.buttonHeight * .5,
            height: MySizes.buttonHeight,
            margin: const EdgeInsetsDirectional.only(end: MySizes.defaultPadding * .25),
            child: Transform.flip(
              flipX: ref.watch(languageProvider) == 'ar' ? true : false,
              child: Icon(
                LineIcons.search,
                size: MySizes.largePadding * .9,
                color: context.color.onPrimary,
              ),
            ),
          )
      ),
    );
  }

}
