import 'package:flutter/material.dart';

extension ContextEx on BuildContext {
  ColorScheme get color => Theme.of(this).colorScheme;
  TextTheme get text => Theme.of(this).textTheme;
}
