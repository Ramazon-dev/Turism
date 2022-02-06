import 'package:flutter/cupertino.dart';
import 'package:mobileapp/core/components/exporting_packages.dart';

class MyDecoration {
  static BoxDecoration assetImage({
  required String assetImage,
    Color? color,
}) => BoxDecoration(
    color: color,
    image: DecorationImage(
      fit: BoxFit.cover,
      image: AssetImage(assetImage),
    )
  );
  static BoxDecoration netImage({
  required String netImage,
  required double border,
    Color? color,
}) => BoxDecoration(
    color: color,
    image: DecorationImage(
      
      fit: BoxFit.cover,
      image: NetworkImage(netImage),
      
    ),
    borderRadius: BorderRadius.circular(border)
  );
}
