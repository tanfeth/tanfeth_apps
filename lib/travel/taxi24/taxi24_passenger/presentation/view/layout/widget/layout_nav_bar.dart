
import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tanfeth_apps/common/shared/extensions/theme_extensions.dart';
import 'package:tanfeth_apps/common/shared/languages.dart';
import 'package:tanfeth_apps/common/shared/sizes.dart';
import 'package:tanfeth_apps/travel/taxi24/taxi24_passenger/presentation/view/layout/vm/layout_vm.dart';


class TaxiDriverLayoutBottomNavigationBar extends ConsumerWidget {
  final LayoutVM layoutVM ;
  const TaxiDriverLayoutBottomNavigationBar({super.key,
  required this.layoutVM});

  @override
  Widget build(BuildContext context,ref) {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      currentIndex: ref.watch(layoutProvider),
      backgroundColor: context.color.surface,
      selectedItemColor: context.color.primary,
      unselectedItemColor: context.color.onPrimaryContainer,
      selectedFontSize: 12,
      unselectedFontSize: 12,
      items: <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          label: LangEnum.home.tr(),
          icon: Icon(
            LineIcons.home,
            color: ref.watch(layoutProvider) == 0
                ? context.color.primary
                : context.color.onPrimaryContainer,
            size: MySizes.largePadding * .85,
          ),
        ),
        BottomNavigationBarItem(
          label: LangEnum.categories.tr(),
          icon: Icon(
            LineIcons.borderAll,
            color: ref.watch(layoutProvider) == 1
                ? context.color.primary
                : context.color.onPrimaryContainer,
            size: MySizes.largePadding * .85,
          ),
        ),
        BottomNavigationBarItem(
          label: LangEnum.categories.tr(),
          icon: Icon(
            LineIcons.percent,
            color: ref.watch(layoutProvider) == 2
                ? context.color.primary
                : context.color.onPrimaryContainer,
            size: MySizes.largePadding * .85,
          ),
        ),
      ],
      onTap: (index) => layoutVM.changeCurrentIndex(index),
    );
  }
}
