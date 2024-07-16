import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

abstract class AppStorage {
  static final GetStorage _box = GetStorage();
  static const String _token = '_token';
  static const String _locale = '_locale';
  static const String _themeMode = '_themeMode';
  static const String _isLogin = '_isLogin';
  static const String _isVisitor = '_isVisitor';
  static const String _onboard = '_onboard';
  static const String _latitude = ' _latitude';
  static const String _longitude = '_longitude';
  static const String _homeCase = '_homeCase';
  static const String _profileCase = '_profileCase';
  static const String _appVersion = '_appVersion';
  
  
  /// Token
  static Future<void> saveApiToken(String token) => _box.write(_token, token);
  static String getApiToken() => _box.read<String>(_token) ?? '';
  static Future<void> clearApiToken() => _box.remove(_token);

  /// Locale
  static Future<void> saveLocaleCode(String locale) => _box.write(_locale, locale);
  static String getLocaleCode() => _box.read<String>(_locale) ?? Get.deviceLocale?.languageCode ?? '';
  static String getIsSavedLocale() => _box.read<String>(_locale) ?? '';
  static Future<void> clearLocaleCode() => _box.remove(_locale);

  /// ThemeMode
  static Future<void> saveThemeMode(ThemeMode mode) => _box.write(_themeMode, mode);
  static ThemeMode getThemeMode() => _box.read<ThemeMode>(_themeMode) ?? ThemeMode.light;

  /// Is Login
  static Future<void> saveIsLogin(bool isLogin) => _box.write(_isLogin, isLogin);
  static bool getIsLogin() => _box.read<bool>(_isLogin) ?? false;
  static Future<void> clearIsLogin() => _box.remove(_isLogin);

  /// is Visitor
  static Future<void> saveIsVisitor(bool isVisitor) => _box.write(_isVisitor, isVisitor);
  static bool getIsVisitor() => _box.read<bool>(_isVisitor) ?? false;
  static Future<void> clearIsVisitor() => _box.remove(_isVisitor);

  /// Onboard Status
  static Future<void> saveOnBoardStatus(bool onboard) => _box.write(_onboard, onboard);
  static bool getOnBoardStatus() => _box.read<bool>(_onboard) ?? false;
  static Future<void> clearOnBoardStatus() => _box.remove(_onboard);

  /// Lat
  static Future<void> saveLatitude(double latitude) => _box.write(_latitude, latitude);
  static String getLatitude() => _box.read<String>(_latitude) ?? '';
  static Future<void> clearLatitude() => _box.remove(_latitude);

  /// Lng
  static Future<void> saveLongitude (double longitude) => _box.write(_longitude ,longitude);
  static String getLongitude() => _box.read<String>(_longitude ) ?? '';
  static Future<void> clearLongitude() => _box.remove(_longitude );

  /// Home case
  static Future<void> showHomeCase (bool showCase) => _box.write(_homeCase ,showCase);
  static bool getHomeCase() => _box.read<bool>(_homeCase ) ?? true;
  static Future<void> clearHomeCase() => _box.remove(_homeCase );



  /// Profile case
  static Future<void> showProfileCase (bool showCase) => _box.write(_profileCase ,showCase);
  static bool getProfileCase() => _box.read<bool>(_profileCase ) ?? true;
  static Future<void> clearProfileCase() => _box.remove(_profileCase );



  /// App version
  static Future<void> saveAppVersion (String appVersion) => _box.write(_appVersion ,appVersion);
  static String getAppVersion() => _box.read<String>(_appVersion ) ?? "";
  static Future<void> clearAppVersion() => _box.remove(_appVersion );




}
