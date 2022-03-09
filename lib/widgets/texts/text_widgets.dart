import 'package:flutter/material.dart';
import 'package:mobileapp/core/components/exporting_packages.dart';

class TextWidgetTwo extends StatelessWidget {
  final String text;
  TextStyle? style;
  TextWidgetTwo(
    this.text, {
    this.style,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
          left: getWidth(15.0), top: getWidth(10.0),bottom: getHeight(10.0), right: getWidth(15.0)),
      child: Text(text, style: style),
    );
  }

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
}