import 'package:flutter/material.dart';
import 'package:mobileapp/core/components/exporting_packages.dart';

class AppTextStyle {
  static TextStyle regular({
    double size = 14.0,
    Color color = AppColors.black,
    String fontFamily = 'Regular',
    double? height,
  }) =>
      TextStyle(
        fontSize: getWidth(size),
        color: color,
        fontWeight: FontWeight.w400,
        fontFamily: fontFamily,
        height: height,
      );

  static TextStyle medium({
    double size = 14.0,
    Color color = AppColors.black,
    String fontFamily = 'Regular',
  }) =>
      TextStyle(
        overflow: TextOverflow.ellipsis,
        fontSize: getWidth(size),
        color: color,
        fontWeight: FontWeight.w500,
        fontFamily: fontFamily,
      );

  static TextStyle semiBold({
    double size = 14.0,
    Color color = AppColors.black,
    String fontFamily = 'Regular',
  }) =>
      TextStyle(
        fontSize: getWidth(size),
        color: color,
        fontWeight: FontWeight.w600,
        fontFamily: fontFamily,
      );

  static TextStyle bold({
    String fontFamily = 'Regular',
    double size = 14.0,
    Color color = AppColors.black,
  }) =>
      TextStyle(
        fontSize: getWidth(size),
        color: color,
        fontWeight: FontWeight.w700,
        fontFamily: fontFamily,
      );
}
