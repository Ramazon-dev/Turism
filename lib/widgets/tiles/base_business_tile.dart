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
      margin: MyEdgeInsets.symmetric(v: 8.0),
      padding: MyEdgeInsets.all(9.0),
      decoration: MyDecoration.circular(
        color: Colors.transparent,
        radius: 7.0,
        border: Border.all(color: AppColors.grey),
      ),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(5.w),
            child: CachedNetworkImage(
                imageUrl: imgUrl, height: 116.h, width: 128.w, fit: BoxFit.cover),
          ),
          SizedBox(width: 9.w),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
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
