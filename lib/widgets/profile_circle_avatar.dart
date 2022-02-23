import 'package:flutter/material.dart';
import 'package:mobileapp/core/components/exporting_packages.dart';
import 'package:mobileapp/services/image_pick_service.dart';

class  ProfileCircleAvatar extends StatelessWidget {
  final String imageUrl;
  double height;

  ProfileCircleAvatar({
    Key? key,
    required this.imageUrl,
    this.height = 100.0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: getHeight(height),
          height: getHeight(height),
          padding: _isDefault() ? EdgeInsets.all(24.w) : EdgeInsets.zero,
          decoration: MyDecoration.circular(
            border: Border.all(color: AppColors.primary, width: getWidth(2)),
            color: Colors.transparent,
            radius: 100.0,
          ),
          child: ClipRRect(
            borderRadius: MyBorderRadius.circular(radius: _isDefault() ? 0.0 : 100.0),
            child:_isDefault()
                ? SvgPicture.asset(AppIcons.personal)
                : Image.network(imageUrl, fit: BoxFit.cover),
          ),
        ),
        Positioned(
          bottom: 0.0,
          right: 0.0,
          child: CircleAvatar(
            backgroundColor: AppColors.primary,
            radius: getWidth(21.43),
            child: SvgPicture.asset(AppIcons.image),
          ).onTap(() {
            ImageChooser.chooseImage();
          }),
        )
      ],
    );
  }
  bool _isDefault() => imageUrl=='default';
}
