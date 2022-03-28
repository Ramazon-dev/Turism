import 'package:flutter/material.dart';
import 'package:mobileapp/core/components/exporting_packages.dart';

class AppTextStyle {
  static TextStyle regular({
    double size = 14.0,
    Color color = AppColors.black,
    double? height,
  }) =>
      TextStyle(
        fontSize: size.sp,
        color: color,
        fontWeight: FontWeight.w400,
        height: height,
      );

  static TextStyle medium({
    double size = 14.0,
    Color color = AppColors.black,
  }) =>
      TextStyle(
        overflow: TextOverflow.ellipsis,
        fontSize: size.sp,
        color: color,
        fontWeight: FontWeight.w500,
      );

  static TextStyle semiBold({
    double size = 14.0,
    Color color = AppColors.black,
  }) =>
      TextStyle(
        fontSize: size.sp,
        color: color,
        fontWeight: FontWeight.w600,
      );

  static TextStyle bold({
    double size = 14.0,
    Color color = AppColors.black,
  }) =>
      TextStyle(
        fontSize: size.sp,
        color: color,
        fontWeight: FontWeight.w700,
      );
}
