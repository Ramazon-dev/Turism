import 'package:flutter/material.dart';
import 'package:mobileapp/core/components/exporting_packages.dart';
import 'package:mobileapp/core/extension/image_extension.dart';

class BaseBusinessTile extends StatelessWidget {
  final String imgUrl;
  final Column infoWidget;
  final String title;

  const BaseBusinessTile({
    Key? key,
    required this.imgUrl,
    required this.infoWidget,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 134.h,
      width: 345.w,
      padding: MyEdgeInsets.all(9.0),
      decoration: MyDecoration.circular(
        color: Colors.transparent,
        border: Border.all(color: AppColors.grey),
      ),
      child: Row(
        children: [
          Image.network(imgUrl, height: 116.h, width: 128.w, fit: BoxFit.cover)
              .circularBorder(radius: 5.w),
          SizedBox(width: 9.w),
          Expanded(
            child: Column(
              children: [
                _setTitle(),
                SizedBox(height: 9.h),
                infoWidget,
              ],
            ),
          ),
        ],
      ),
    );
  }

  Text _setTitle() => Text(title, style: AppTextStyle.medium(size: 18.0));
}
