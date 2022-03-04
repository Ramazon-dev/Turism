import 'package:flutter/material.dart';
import 'package:mobileapp/core/components/exporting_packages.dart';
import 'package:mobileapp/screens/profile/change_info_page.dart';

class ProfileInfoCard extends StatelessWidget {
  final UserModel user;

  const ProfileInfoCard({Key? key, required this.user}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 231.w,
      height: 240.h,
      child: Card(
        shape: MyShape.simple(radius: 10.0),
        elevation: 6.0,
        child: Padding(
          padding: EdgeInsets.only(top: 23.h),
          child: Column(
            children: [
              ProfileCircleAvatar(imageUrl: user.image ?? 'default'),
              MySizedBox(height: 15.0),
              Text(user.name, style: AppTextStyle.medium(size: 18.0)),
              MySizedBox(height: 9.0),
              Text(
                user.email.substring(0, 25),
                style: AppTextStyle.medium(color: AppColors.grey),
              ),
              MySizedBox(height: 15.0),
              BlueButton(onPressed: _onPressed, label: LocaleKeys.edit.tr()),
            ],
          ),
        ),
      ),
    );
  }

  void _onPressed() => CustomNavigator.push(const ChangingProfilePage());
}
