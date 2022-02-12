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
          ProfileInfoCard(),
        ],
      ),
    );
  }
}
