import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

abstract class TaxiPassengerAppStorage {
  static final GetStorage _box = GetStorage();
  static const String _homeCase = '_homeCase ';
  static const String _homeTripFooterCase = '_homeTripFooterCase ';
  static const String _homeFindDriverCase = '_homeFindDriverCase ';
  static const String _profileCase = '_profileCase ';
  static const String _destinationCase = '_destinationCase ';

  /// Home case
  static Future<void> showHomeCase (bool showCase) => _box.write(_homeCase ,showCase);
  static bool getHomeCase() => _box.read<bool>(_homeCase ) ?? true;
  static Future<void> clearHomeCase() => _box.remove(_homeCase );

  /// Home trip footer case
  static Future<void> showHomeTripFooterCase (bool showCase) => _box.write(_homeTripFooterCase ,showCase);
  static bool getHomeTripFooterCase() => _box.read<bool>(_homeTripFooterCase ) ?? true;
  static Future<void> clearHomeTripFooterCase() => _box.remove(_homeTripFooterCase );


  /// Home find driver case
  static Future<void> showHomeFindDriverCase (bool showCase) => _box.write(_homeFindDriverCase ,showCase);
  static bool getHomeFindDriverCase() => _box.read<bool>(_homeFindDriverCase ) ?? true;
  static Future<void> clearHomeFindDriverCase() => _box.remove(_homeFindDriverCase );



  /// Destination case
  static Future<void> showDestinationCase (bool showCase) => _box.write(_destinationCase ,showCase);
  static bool getDestinationCase() => _box.read<bool>(_destinationCase ) ?? true;
  static Future<void> clearDestinationCase() => _box.remove(_destinationCase );


  /// Profile case
  static Future<void> showProfileCase (bool showCase) => _box.write(_profileCase ,showCase);
  static bool getProfileCase() => _box.read<bool>(_profileCase ) ?? true;
  static Future<void> clearProfileCase() => _box.remove(_profileCase );






}
