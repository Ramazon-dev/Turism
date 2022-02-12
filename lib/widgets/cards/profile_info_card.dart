import 'package:flutter/material.dart';
import 'package:mobileapp/core/components/exporting_packages.dart';

class ProfileInfoCard extends StatelessWidget {
  const ProfileInfoCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 6.0,
      child: Padding(
        padding: MyEdgeInsets.all(24.0),
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ProfileCircleAvatar(imageUrl: 'https://source.unsplash.com/random/5'),
            MySizedBox(height: 15.0),
            Text('Зиёда Собирова', style: TextWidget.medium(size: 18.0)),
            MySizedBox(height: 9.0),
            Text('sobirovaziyoda@gmail.com', style: TextWidget.medium(color: AppColors.grey)),
            MySizedBox(height: 15.0),
            BlueButton(onPressed: (){}, label: 'Изменить')
          ],
        ),
      ),
    );
  }
}
