import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tanfeth_apps/common/shared/extensions/padding_extension.dart';
import 'package:tanfeth_apps/common/shared/extensions/theme_extensions.dart';
import 'package:tanfeth_apps/common/shared/images.dart';
import 'package:api_controller/shared/sizes.dart';


class NotificationCell extends StatelessWidget {

  const NotificationCell({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: 15.toAll,
      decoration: BoxDecoration(
        borderRadius: MySizes.borderRadius * 1.5,
        color: context.color.surface,
        boxShadow: MySizes.defaultBoxShadow(context),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          Container(
              width: MySizes.buttonHeight,
              height: MySizes.buttonHeight,
              child:Material(
                shape: CircleBorder(),
                clipBehavior: Clip.antiAliasWithSaveLayer,
                child: Ink.image(
                  image: AssetImage(Images.appLogo),
                  fit: BoxFit.cover,
                  height: 60 ,
                  width: 60,
                ),
              )
          ),
          10.pw,
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                        'هناك حقيقة مثبتة منذ زمن طويل هناك حقيقة مثبتة منذ زمن طويل'),

                Text(
                        '2023-03-02 - 09:45',
                        style: context.textTheme.labelSmall?.copyWith(
                          color: context.color.onPrimaryContainer,
                        ),
                      ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
