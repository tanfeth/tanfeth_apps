import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ScreenConfig {
  String path;
  Widget widget;
  String key;

  ScreenConfig({
    this.path = '',
    this.widget = const SizedBox(),
    this.key = "",
    ScreenConfig? config,
  }) {
    if (config != null) {
      path = config.path;
      widget = config.widget;
      key = config.key;
    }
    if (key.isEmpty) key = path;
    if (key.startsWith("/")) key = key.substring(1);
    if (key.endsWith("/")) key = key.substring(0, key.length - 1);
  }

  GetPage get page {
    return GetPage(name: path, page: () => widget);
  }
}
