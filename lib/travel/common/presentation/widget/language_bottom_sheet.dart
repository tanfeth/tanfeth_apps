

import 'package:api_controller/presentation/widget/radio_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:api_controller/presentation/widget/bottom_sheet/close_bottom_sheet_widget.dart';
import 'package:api_controller/shared/extensions/padding_extension.dart';
import 'package:api_controller/shared/extensions/theme_extensions.dart';
import 'package:tanfeth_apps/common/shared/languages.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:api_controller/mode/app_mode.dart';
import 'package:tanfeth_apps/common/shared/routing/routes/splash_routing.dart';
import 'package:api_controller/vm/langauge/langauge_vm.dart';

class LangBottomSheet extends ConsumerWidget {
  const LangBottomSheet({super.key});

  @override
  Widget build(BuildContext context,ref) {
    return SafeArea(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          10.ph,
          const Center(child: CloseBottomSheetWidget()),
          15.ph,
          Text(
           LangEnum.language.tr(),
            style: context.text.titleMedium,
          ),
          5.ph,
          Row(
              children: [
                Expanded(
                  child: RadioWidget(
                    value: 'ar',
                    groupValue: ref.watch(languageProvider),
                    onChanged: (val) {
                      ref.read(languageProvider.notifier).update(locale: "ar");


                    },
                    label:LangEnum.arabic.tr(),
                  ),
                ),
                Expanded(
                  child: RadioWidget(
                    value: 'en',
                    groupValue: ref.watch(languageProvider),
                    onChanged: (val) {
                      ref.read(languageProvider.notifier).update(locale: "en");
                    },
                    label:LangEnum.english.tr(),
                  ),
                ),
              ],
            ),
          15.ph,
          ElevatedButton(
            onPressed: () async {
              Get.back();
              AppMode.changeLanguageMode(localeCode: ref.read(languageProvider),ref: ref);
              ref
                  .read(languageProvider.notifier)
                  .update(locale:ref.read(languageProvider));
              Get.offAllNamed(
                  SplashRouting.config().path);
              },
            child: Text(LangEnum.save.tr()),
          ),
          15.ph,
        ],
      ).hPadding(30),
    );
  }
}
