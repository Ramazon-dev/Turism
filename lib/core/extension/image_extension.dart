import 'package:flutter/cupertino.dart';

extension ImageExtension on Image {
  circularBorder({double radius = 7.0}) => ClipRRect(
        child: this,
        borderRadius: BorderRadius.circular(radius),
      );
}
