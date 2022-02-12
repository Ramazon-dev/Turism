import 'package:flutter/material.dart';
import 'package:mobileapp/core/components/exporting_packages.dart';
import 'package:mobileapp/core/components/my_border_radius.dart';

class ProfileAppBar extends StatelessWidget {
  double height;

  ProfileAppBar({Key? key, this.height = 152.0}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: const Alignment(0.0, -0.6),
      height: getHeight(height),
      decoration: BoxDecoration(
        gradient: AppColors.linearGradient,
        borderRadius: MyBorderRadius.only(bottomLeft: 32.0, bottomRight: 32.0),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          IconButton(
            onPressed: () {},
            icon: SvgPicture.asset(AppIcons.arrowBackWhite),
          ),
          MySizedBox(width: 110.0),
          Text(
            'Profile',
            style: TextWidget.medium(color: AppColors.white, size: 18.0),
          )
        ],
      ),
    );
  }
}
