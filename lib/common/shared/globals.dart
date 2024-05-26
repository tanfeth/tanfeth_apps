import 'package:flutter/cupertino.dart';
import 'package:path_provider/path_provider.dart';

class Globals {
  Globals._();

  static const double borderRadius = 27;
  static const double defaultPadding = 8;
  static String documentPath = '';
  static GlobalKey<AnimatedListState> audioListKey =
      GlobalKey<AnimatedListState>();

  static Future<void>init() async {
    documentPath = "${(await getApplicationDocumentsDirectory()).path}/";
  }
}
