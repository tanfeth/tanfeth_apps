

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tanfeth_apps/common/shared/languages.dart';
import 'package:tanfeth_apps/common/shared/storage_manager.dart';


class AppMode {
  static String get themeMode => "THEME_MODE";

  static changeThemeMode() {
    Get.changeThemeMode(Get.isDarkMode ? ThemeMode.light : ThemeMode.dark);
    StorageManager.saveData(themeMode, !Get.isDarkMode);
  }

  static ThemeMode getThemeMode() {
    var brightness = View.of(Get.context!).platformDispatcher.platformBrightness;
   // var brightness = SchedulerBinding.instance.window.platformBrightness;
    bool isDarkMode = brightness == Brightness.dark;
    if (StorageManager.containData(themeMode)){
      if (StorageManager.readData(themeMode, Get.isDarkMode)) {
        return ThemeMode.dark;
      } else {
        return ThemeMode.light;
      }
  } else {
      return isDarkMode ? ThemeMode.dark : ThemeMode.light;
    }
/*
    else
    return StorageManager.readData(THEME_MODE, Get.isDarkMode)
    ? ThemeMode.dark
        : ThemeMode.light*/
  }

  static changeLanguageMode() {
    // Support AR & EN
    var ar = "ar";
    var en = "en";
    if (Get.locale!.languageCode == ar) {
      StorageManager.saveData(
          LangEnum.language.toString(), en);
      Get.updateLocale(Locale(en));
    } else if (Get.locale!.languageCode == en) {
      StorageManager.saveData(
          LangEnum.language.toString(), ar);
      Get.updateLocale(Locale(ar));
    }
  }

  static String getLanguageMode({String initLang = "en"}) {
    if (!StorageManager.containData(
        LangEnum.language.toString())) {
      StorageManager.saveData(
          LangEnum.language.toString(), initLang);
    }
    return StorageManager.readData(
        LangEnum.language.toString(), initLang);
  }
}
