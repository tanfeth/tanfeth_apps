import 'package:flutter/material.dart';

extension PaddingExtension on num {
  SizedBox get ph => SizedBox(height: toDouble());

  SizedBox get pw => SizedBox(width: toDouble());

  EdgeInsets get toAll => EdgeInsets.all(toDouble());

  EdgeInsets get toHorizontal => EdgeInsets.symmetric(horizontal: toDouble());

  EdgeInsets get toVertical => EdgeInsets.symmetric(vertical: toDouble());
}

extension PaddingSymmetricEx on (num, num) {
  EdgeInsets get toSymmetric => EdgeInsets.symmetric(vertical: $1.toDouble(), horizontal: $2.toDouble());
}

extension PaddingOnlyEx on (num, num, num, num) {
  EdgeInsetsDirectional get toOnly => EdgeInsetsDirectional.only(
        top: $1.toDouble(),
        bottom: $2.toDouble(),
        start: $3.toDouble(),
        end: $4.toDouble(),
      );
}

extension WidgetPaddingEx on Widget {
  Widget hPadding(double padding) => Padding(padding: EdgeInsets.symmetric(horizontal: padding), child: this);

  Widget vPadding(double padding) => Padding(padding: EdgeInsets.symmetric(vertical: padding), child: this);

  Widget allPadding(double padding) => Padding(padding: EdgeInsets.all(padding), child: this);

  Widget onlyPadding(double top, double bottom, double start, double end) => Padding(
        padding: EdgeInsetsDirectional.only(top: top, bottom: bottom, start: start, end: end),
        child: this,
      );

  Widget symmetricPadding(double horizontal, double vertical) => Padding(
        padding: EdgeInsetsDirectional.symmetric(horizontal: horizontal, vertical: vertical),
        child: this,
      );
}
