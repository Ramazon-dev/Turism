import 'package:flutter/material.dart';
import 'package:mobileapp/core/components/exporting_packages.dart';

class MyEdgeInsets {
  static EdgeInsets symmetric({double h = 0.0, double v = 0.0}) =>
      EdgeInsets.symmetric(
        horizontal: getWidth(h),
        vertical: getHeight(v),
      );

  static EdgeInsets all(double size) => EdgeInsets.symmetric(
        horizontal: getWidth(size),
        vertical: getHeight(size),
      );

  static EdgeInsets only({
    double top = 0.0,
    double bottom = 0.0,
    double left = 0.0,
    double right = 0.0,
  }) =>
      EdgeInsets.only(
        top: getHeight(top),
        left: getHeight(left),
        right: getHeight(right),
        bottom: getHeight(bottom),
      );
}
