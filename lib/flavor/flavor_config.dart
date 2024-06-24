import 'package:flutter/material.dart';
import 'package:tanfeth_apps/common/shared/end_points.dart';
import 'package:tanfeth_apps/common/shared/enum.dart';
import 'package:tanfeth_apps/common/shared/languages.dart';
import 'package:tanfeth_apps/common/shared/theme/theme.dart';
import 'package:tanfeth_apps/travel/common/shared/end_point/common_end_points.dart';


class FlavorConfig {
  final String secretJWT;
  dynamic languages;

   ITheme myTheme = MyTheme();
  final AppNameEnum appNameEnum;
  final String defaultCountryCode;
  final CommonEnum commonEnum;
  final Set<AppCategoryEnum> appCategoryEnum;
  final List<Locale> supportedLocales;
  final Locale fallbackLocale;
  final String baseUrl;
  final String shareUrl;
  final CommonEndpoints endPoints;
  String mapApiKey;
  String signalR;

  FlavorConfig({
    MyLanguages? myLanguages,
    ITheme? theme,
    required this.appNameEnum,
    required this.appCategoryEnum,
    required this.baseUrl,
    this.defaultCountryCode="SA",
    required this.commonEnum,
    required this.endPoints,
    this.secretJWT = "",
    this.signalR = "https://signalr-microservices-dev.azurewebsites.net",
    this.fallbackLocale = const Locale("en"),
    this.supportedLocales = const [Locale("ar"), Locale("en")],
    required this.shareUrl,
    this.mapApiKey = '',
  }){
    if (myLanguages != null){
      this.languages = myLanguages;
    } else{
      this.languages = MyLanguages();
    }

    if (theme != null) this.myTheme = theme;
  }
}

enum AppNameEnum {
  taxi24Driver,
  taxi24Passenger
}

enum AppCategoryEnum {
  travel,
}
