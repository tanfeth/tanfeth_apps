import 'package:api_controller/shared/extensions/padding_extension.dart';
import 'package:api_controller/shared/extensions/theme_extensions.dart';
import 'package:api_controller/shared/sizes.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/get.dart';
import 'package:badges/badges.dart' as badges;
import 'package:line_icons/line_icons.dart';
import 'package:tanfeth_apps/common/shared/routing/routes/notification_route.dart';



class AppbarNotification extends ConsumerWidget {
  const AppbarNotification({super.key});

  @override
  Widget build(BuildContext context,ref) {
    return Padding(
      padding: (0, 0, 0, 0).toOnly,
      child: InkWell(
        onTap: () => Get.toNamed(NotificationsRouting.config().path),
        child: SizedBox(
          width: MySizes.buttonHeight * .8,
          height: MySizes.buttonHeight,
          child: badges.Badge(
            position: badges.BadgePosition.topStart(top: 8, start: 6),
            badgeAnimation:
            const badges.BadgeAnimation.rotation(toAnimate: false),
            badgeStyle: badges.BadgeStyle(
              elevation: 0,
              badgeColor: context.color.primary,
              padding: const EdgeInsets.all(4),
            ),
            child:  Center(
              child: Icon(
                LineIcons.bell,
                color: context.color.onPrimary,
                size: MySizes.largePadding * .9,
              ),
            ),
          ),
        ),
      )
    );
  }
}
