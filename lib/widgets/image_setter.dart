import 'package:flutter/material.dart';
import 'package:mobileapp/core/components/exporting_packages.dart';

class ImageSetter extends StatelessWidget {
  const ImageSetter({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 288.0.h,
      width: 315.0.w,
      padding: MyEdgeInsets.all(12.0),
      decoration: MyDecoration.circular(
        color: Colors.transparent,
        border: Border.all(color: AppColors.grey),

      ),

    );
  }
}
