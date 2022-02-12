import 'package:flutter/material.dart';
import 'package:mobileapp/core/components/exporting_packages.dart';
import 'package:mobileapp/widgets/cards/profile_info_card.dart';

class ProfileAuthPage extends StatelessWidget {
  const ProfileAuthPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: const SimpleAppBar(title: 'Profile'),
      body: Column(
        children: [
          ProfileAppBar(height: 274.0),
          Transform.translate(
            offset: Offset(0.0, getHeight(-140.0)),
            child: const ProfileInfoCard(),
          ),
          Transform.translate(
            offset: Offset(getWidth(100.0), getHeight(-140.0)),
            child: TextButtonWidget(
              onPressed: () {},
              label: 'Изменить пароль?',
            ),
          )
        ],
      ),
    );
  }
}
