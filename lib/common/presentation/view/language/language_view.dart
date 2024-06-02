import 'package:flutter/material.dart';
import 'package:tanfeth_apps/common/shared/extensions/button_extensions.dart';
import 'package:tanfeth_apps/common/shared/extensions/padding_extension.dart';
import 'package:tanfeth_apps/common/shared/images.dart';
import 'package:tanfeth_apps/common/shared/languages.dart';
import 'package:tanfeth_apps/common/shared/mode/app_mode.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tanfeth_apps/common/shared/web_width.dart';
import 'package:tanfeth_apps/common/vm/langauge/langauge_vm.dart';


class LanguageView extends ConsumerWidget {
  const LanguageView();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: WebWidth(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: 250,
              height: 250,
              child: Image.asset(Images.appLogo),
            ),
            50.ph,
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: ElevatedButton(
                    style: const ButtonStyle().GreyElevatedButton(context),
                    onPressed: () {
                      AppMode.changeLanguageMode(localeCode: "en",ref: ref);
                    },
                    child: Text(
                      LangEnum.english.tr(),
                      textScaler: TextScaler.noScaling,
                    ),
                  ),
                ),
                15.pw,
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      AppMode.changeLanguageMode(localeCode: "ar",ref: ref);
                      ref
                          .read(languageProvider.notifier)
                          .update(locale: "ar");
                    },
                    child: Text(LangEnum.arabic.tr()),
                  ),
                ),
              ],
            ).hPadding(30),
          ],
        ),
      ),
    );
  }
}
