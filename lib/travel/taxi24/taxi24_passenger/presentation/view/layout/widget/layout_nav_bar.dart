import 'package:animated_notch_bottom_bar/animated_notch_bottom_bar/animated_notch_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tanfeth_apps/common/shared/extensions/theme_extensions.dart';
import 'package:tanfeth_apps/common/shared/languages.dart';
import 'package:tanfeth_apps/travel/taxi24/taxi24_passenger/presentation/view/layout/vm/layout_vm.dart';

class TaxiPassengerLayoutBottomNavigationBar extends ConsumerStatefulWidget {
  final LayoutVM layoutVM;
  final Function(int index) onItemTap;
  const TaxiPassengerLayoutBottomNavigationBar(
      {Key? key, required this.layoutVM,
       required this.onItemTap})
      : super(key: key);

  @override
  ConsumerState<TaxiPassengerLayoutBottomNavigationBar> createState() =>
      _TaxiPassengerLayoutBottomNavigationBarState();
}

class _TaxiPassengerLayoutBottomNavigationBarState
    extends ConsumerState<TaxiPassengerLayoutBottomNavigationBar> {
  final NotchBottomBarController notchBottomBarController =
      NotchBottomBarController(index: 1);

  @override
  Widget build(BuildContext context) {
    return AnimatedNotchBottomBar(
      elevation: 20,
      kBottomRadius: 0,
      kIconSize: 30,
      removeMargins: true,
      notchBottomBarController: notchBottomBarController,
      bottomBarItems: <BottomBarItem>[

        BottomBarItem(
          itemLabel: LangEnum.wallet.tr(),
          inActiveItem: Icon(
            LineIcons.wallet,
            color: context.color.onPrimaryContainer,
            size: 30,
          ),
          activeItem: Icon(
            LineIcons.wallet,
            color: context.color.primary,
            size: 30,
          ),
        ),

        BottomBarItem(
          itemLabel: LangEnum.home.tr(),
          inActiveItem: Icon(
            LineIcons.home,
            color: context.color.onPrimaryContainer,
            size: 30,
          ),
          activeItem: Icon(
            LineIcons.home,
            color: context.color.primary,
            size: 30,
          ),
        ),


        BottomBarItem(
          itemLabel: LangEnum.profile.tr(),
          inActiveItem: Icon(
            Icons.person,
            color: context.color.onPrimaryContainer,
            size: 30,
          ),
          activeItem: Icon(
            Icons.person,
            color: context.color.primary,
            size: 30,
          ),
        ),
      ],
      onTap:  widget.onItemTap,
    );
  }
}
