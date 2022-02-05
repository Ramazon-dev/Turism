import 'package:flutter/material.dart';
import 'package:mobileapp/core/components/exporting_packages.dart';

class TextWidget extends StatelessWidget {
  final String text;
  TextStyle? style;

  TextWidget(this.text, {Key? key, this.style}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: style,
    );
  }

  static TextStyle regular({
    double size = 14.0,
    Color color = AppColors.black,
    String fontFamily = 'Regular',
  }) =>
      TextStyle(
        fontSize: getWidth(size),
        color: color,
        fontWeight: FontWeight.w400,
        fontFamily: fontFamily,
      );

  static TextStyle medium({
    double size = 14.0,
    Color color = AppColors.black,
    String fontFamily = 'Regular',
  }) =>
      TextStyle(
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
