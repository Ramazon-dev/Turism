import 'package:flutter/material.dart';
import 'package:mobileapp/core/components/exporting_packages.dart';
import 'package:mobileapp/screens/profile/change_info_page.dart';

class ProfileInfoCard extends StatelessWidget {
  final UserModel user;

  const ProfileInfoCard({Key? key, required this.user}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print(user.toMap());
    return Card(
      shape: MyShape.simple(radius: 10.0),
      elevation: 6.0,
      child: Padding(
        padding: MyEdgeInsets.all(24.0),
        child: Column(
          children: [
            ProfileCircleAvatar(imageUrl: user.image ?? 'default'),
            MySizedBox(height: 15.0),
            Text(user.name, style: TextWidget.medium(size: 18.0)),
            MySizedBox(height: 9.0),
            Text(
              user.email,
              style: TextWidget.medium(color: AppColors.grey),
            ),
            MySizedBox(height: 15.0),
            BlueButton(onPressed: _onPressed, label: LocaleKeys.edit.tr()),
          ],
        ),
      ),
    );
  }

  void _onPressed() => CustomNavigator().push(const ChangingProfilePage());
}
