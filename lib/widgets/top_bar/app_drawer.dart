import 'package:flutter/material.dart';
import 'package:mobileapp/core/components/exporting_packages.dart';

class DrawerPage extends StatelessWidget {
  const DrawerPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(gradient: AppColors.linearGradient),
        child: Column(
          children: [
            _setCategory(AppIcons.dollar, 'Wallet'),
            _setCategory(AppIcons.dollar, 'Embassy'),
            _setCategory(AppIcons.personal, 'About us'),
            _setCategory(AppIcons.search, 'Settings'),
            _setCategory(AppIcons.home, 'Exit'),
          ],
        ),
      ),
    );
  }

  ListTile _setCategory(String assetIcon, String title) => ListTile(
        title: TextWidget(
          title,
          style: TextWidget.regular(size: 32.0, color: AppColors.white),
        ),
      );
}
