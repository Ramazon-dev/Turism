import 'package:flutter/material.dart';
import 'package:mobileapp/core/components/exporting_packages.dart';
import 'package:mobileapp/screens/business_profile/git_info_page.dart';
import 'package:mobileapp/screens/hotel/hotel_page.dart';
import 'package:mobileapp/screens/other/other_page.dart';
import 'package:mobileapp/screens/place/place_page.dart';
import 'package:mobileapp/screens/settings/settings_page.dart';

class DrawerWidget extends StatelessWidget {
  const DrawerWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Drawer(
      backgroundColor: AppColors.primary,
      child: ListView(
        children: [
          _setCategory('Currency', AppIcons.dollar, const HotelListPage()),
          _setCategory('Places', AppIcons.location, const PlacePage()),
          _setCategory('Git', AppIcons.location, const GitInfoPage()),
          _setCategory('Other', AppIcons.arrowBack, const OtherPage()),
          _setCategory('Настройки', AppIcons.arrowBack, const SettingsPage()),
        ],
      ),
    );
  }

  ListTile _setCategory(String title, String icon, Widget page) => ListTile(
        onTap: () {
          _onTap(page);
        },
        leading: SvgPicture.asset(icon, height: getHeight(32.0)),
        title: TextWidget(
          title,
          style: TextWidget.regular(color: AppColors.white, size: 32.0),
        ),
      );

  void _onTap(Widget page) {
    CustomNavigator().push(page);
  }
}
