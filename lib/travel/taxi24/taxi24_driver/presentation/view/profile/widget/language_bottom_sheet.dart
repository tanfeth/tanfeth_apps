

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tanfeth_apps/common/presentation/widget/bottom_sheet/close_bottom_sheet_widget.dart';
import 'package:tanfeth_apps/common/presentation/widget/radio_widget.dart';
import 'package:tanfeth_apps/common/shared/extensions/padding_extension.dart';
import 'package:tanfeth_apps/common/shared/extensions/theme_extensions.dart';
import 'package:tanfeth_apps/common/shared/languages.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tanfeth_apps/common/shared/mode/app_mode.dart';
import 'package:tanfeth_apps/common/vm/langauge/langauge_vm.dart';

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
              AppMode.changeLanguageMode(localeCode: ref.read(languageProvider)
                  ,ref: ref);
            },
            child: Text(LangEnum.save.tr()),
          ),
          15.ph,
        ],
      ).hPadding(30),
    );
  }
}
