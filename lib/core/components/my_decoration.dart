import 'package:flutter/cupertino.dart';
import 'package:mobileapp/core/components/exporting_packages.dart';

import 'my_border_radius.dart';

class MyDecoration {
  static BoxDecoration assetImage({
    required String assetImage,
    Color? color,
  }) =>
      BoxDecoration(
          color: color,
          image: DecorationImage(
            fit: BoxFit.cover,
            image: AssetImage(assetImage),
          ));

  static BoxDecoration circular(
          {double radius = 5.0, Color color = AppColors.darkCyan}) =>
      BoxDecoration(
        color: color,
        borderRadius: MyBorderRadius.circular(radius: radius),
      );
}
