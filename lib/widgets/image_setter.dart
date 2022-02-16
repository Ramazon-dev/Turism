import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:mobileapp/core/components/exporting_packages.dart';

class ImageSetter extends StatelessWidget {
  const ImageSetter({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 302.0.h,
      width: 315.0.w,
      padding: MyEdgeInsets.all(12.0),
      decoration: MyDecoration.circular(
        color: Colors.transparent,
        border: Border.all(color: AppColors.grey),
      ),
      child: Column(
        children: [
          _dottedBorder(
            height: 216.0,
            width: 291.0,
            child: SvgPicture.asset(
              AppIcons.add,
              color: AppColors.grey,
              height: 61.0.h,
              fit: BoxFit.contain,
            ),
          ),
          SizedBox(height: 12.0.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _dottedBorder(),
              _dottedBorder(),
              _dottedBorder(),
              _dottedBorder(),
            ],
          )
        ],
      ),
    );
  }

  DottedBorder _dottedBorder({
    double height = 40.0,
    double width = 65.0,
    Widget? child,
  }) =>
      DottedBorder(
        borderType: BorderType.Rect,
        dashPattern: [7.5.w, 0.0,7.5.w , 5.0.w],
        color: AppColors.grey,
        radius: Radius.circular(4.0.w),
        child: SizedBox(
          height: height.h,
          width: width.w,
          child: child,
        ),
      );
}
