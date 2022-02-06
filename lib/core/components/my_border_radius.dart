import 'package:flutter/material.dart';
import 'package:mobileapp/core/components/exporting_packages.dart';

class MyBorderRadius {
  static BorderRadius circular({double radius = 5.0}) =>
      BorderRadius.circular(getWidth(radius));

  static BorderRadius only({
    double topRight = 0.0,
    double topLeft = 0.0,
    double bottomRight = 0.0,
    double bottomLeft = 0.0,
  }) =>
      BorderRadius.only(
        topLeft: Radius.circular(getWidth(topLeft)),
        topRight: Radius.circular(getWidth(topRight)),
        bottomRight: Radius.circular(getWidth(bottomRight)),
        bottomLeft: Radius.circular(getWidth(bottomLeft)),
      );
}
