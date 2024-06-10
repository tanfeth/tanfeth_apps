import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tanfeth_apps/common/shared/extensions/padding_extension.dart';
import 'package:tanfeth_apps/common/shared/languages.dart';
import 'package:tanfeth_apps/common/shared/routing/routes/layout_route.dart';
import 'package:tanfeth_apps/common/shared/sizes.dart';
import 'package:tanfeth_apps/common/shared/storage.dart';


class VisitorButton extends StatelessWidget {
  const VisitorButton({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MySizes.largePadding,
      child: TextButton(
        onPressed: () {
          AppStorage.saveIsVisitor(true);
          AppStorage.saveIsLogin(false);
          Get.offAllNamed(LayoutRouting.config().path);
        },
        child: Text(LangEnum.visitor.tr()),
      ),
    ).onlyPadding(0, 0, 0, MySizes.largePadding);
  }
}