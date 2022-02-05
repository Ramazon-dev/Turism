import 'package:flutter/cupertino.dart';

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
}