import 'package:flutter/cupertino.dart';
import 'package:mobileapp/core/components/exporting_packages.dart';
import 'package:mobileapp/core/components/my_border_radius.dart';

class MyDecoration {
  static BoxDecoration assetImage({
    required String assetImage,
    Color? color,
    double radius = 7.0,
    BoxBorder? border,
  }) =>
      BoxDecoration(
          color: color,
          borderRadius: MyBorderRadius.circular(radius: radius),
          border: border,
          image: DecorationImage(
            fit: BoxFit.cover,
            image: AssetImage(assetImage),
          ));

  static BoxDecoration netImage({
    required String netImage,
    double radius = 7.0,
    Color? color,
    BoxBorder? border,
  }) =>
      BoxDecoration(
          color: color,
          border: border,
          image: DecorationImage(
            fit: BoxFit.cover,
            image: NetworkImage(netImage),
          ),
          borderRadius: BorderRadius.circular(getWidth(radius)));

  static BoxDecoration circular({
    double radius = 5.0,
    Color color = AppColors.darkCyan,
    BoxBorder? border,
  }) =>
      BoxDecoration(
        color: color,
        borderRadius: MyBorderRadius.circular(radius: radius),
        border: border,
      );

  static BoxDecoration shadow({Color color = AppColors.darkCyan}) =>
      BoxDecoration(
        color: color,
        boxShadow: [
          BoxShadow(
              color: color,
              spreadRadius: 1,
              blurRadius: 1,
              offset: const Offset(0, 1) // changes position of shadow
              ),
        ],
      );
}
