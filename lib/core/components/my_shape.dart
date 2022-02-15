import 'package:flutter/material.dart';
import 'package:mobileapp/core/components/exporting_packages.dart';

class MyShape {
  static RoundedRectangleBorder simple({double radius = 5.0}) =>
      RoundedRectangleBorder(
        borderRadius: MyBorderRadius.circular(radius: radius),
      );
}
