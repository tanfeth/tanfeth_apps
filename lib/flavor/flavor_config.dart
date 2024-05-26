import 'package:flutter/material.dart';
import 'package:tanfeth_apps/common/shared/end_points.dart';
import 'package:tanfeth_apps/common/shared/enum.dart';
import 'package:tanfeth_apps/common/shared/languages.dart';
import 'package:tanfeth_apps/common/shared/theme/theme.dart';


class FlavorConfig {
  final String secretJWT;
  dynamic myLanguages;

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
  String signalR;

  FlavorConfig({
    dynamic myLanguages,
    ITheme? myTheme,
    required this.appNameEnum,
    required this.appCategoryEnum,
    required this.baseUrl,
    required this.commonEnum,
    required this.endPoints,
    this.defaultCountryCode="EG",
    this.secretJWT = "",
    this.signalR = "https://signalr-microservices-dev.azurewebsites.net",
    this.supportedLocales = const [
      const Locale("ar"),
      const Locale("en"),
    ],
    this.fallbackLocale = const Locale("en"),
    required this.shareUrl,
  }){
    if (myLanguages != null){
      this.myLanguages = myLanguages;

    } else{
      this.myLanguages = MyLanguages();
    }

    if (myTheme != null) this.myTheme = myTheme;
  }
}

enum AppNameEnum {
  taxi24Driver,
  taxi24Client
}

enum AppCategoryEnum {
  travel,
}
