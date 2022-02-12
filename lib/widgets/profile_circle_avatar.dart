import 'package:flutter/material.dart';
import 'package:mobileapp/core/components/exporting_packages.dart';

class ProfileCircleAvatar extends StatelessWidget {
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
          height: getHeight(height),
          decoration: imageUrl == 'default'
              ? MyDecoration.assetImage(
                  assetImage: AppIcons.personal,
                  radius: 100.0,
                  border: _setBorder(),
                )
              : MyDecoration.netImage(
                  netImage: imageUrl,
                  radius: 100.0,
                  border: _setBorder(),
                ),
        ),
      ],
    );
  }

  Border _setBorder() => Border.all(
        color: AppColors.primary,
        width: getWidth(2.0),
      );
}
