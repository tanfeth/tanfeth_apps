
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tanfeth_apps/common/shared/routing/routes/splash_routing.dart';
import 'package:tanfeth_apps/common/shared/storage.dart';
import 'package:tanfeth_apps/common/shared/storage_manager.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tanfeth_apps/common/vm/langauge/langauge_vm.dart';


class AppMode {
  static const String THEME_MODE = "THEME_MODE";

  static changeThemeMode() {
    Get.changeThemeMode(Get.isDarkMode ? ThemeMode.light : ThemeMode.dark);
    StorageManager.saveData(THEME_MODE, !Get.isDarkMode);
  }

  static ThemeMode getThemeMode() {
    var brightness = WidgetsBinding.instance.platformDispatcher.platformBrightness;
    bool isDarkMode = brightness == Brightness.dark;
    if (StorageManager.containData(THEME_MODE))
      return StorageManager.readData(THEME_MODE, Get.isDarkMode)
          ? ThemeMode.dark
          : ThemeMode.light;
    else
      return isDarkMode ? ThemeMode.light : ThemeMode.light;

  }

  static changeLanguageMode({required String localeCode,
    required WidgetRef ref}) {
    // Support AR & EN
    AppStorage.saveLocaleCode(localeCode);
    Get.updateLocale(Locale(localeCode));
    ref
        .read(languageProvider.notifier)
        .update(locale: localeCode);
    Get.offAllNamed(
        SplashRouting.config().path);
  }


  static String getLanguageMode({String initLang = "en"}) {
    if (AppStorage.getLocaleCode().isEmpty)
      AppStorage.saveLocaleCode(initLang);
    return AppStorage.getLocaleCode();
  }
}
