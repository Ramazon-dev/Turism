import 'package:flutter/material.dart';
import 'package:mobileapp/core/components/exporting_packages.dart';
import 'package:mobileapp/screens/about_us_page.dart';

class DrawerWidget extends StatelessWidget {
  const DrawerWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Drawer(
      backgroundColor: AppColors.primary,
      child: SafeArea(
        child: Column(
          children: [
            _setCategory('Hotel', AppIcons.dollar, const HotelListPage()),
            _setCategory('Currency', AppIcons.dollar, const CurrencyPage()),
            _setCategory('Places', AppIcons.location, const PlacePage()),
            _setCategory('Git', AppIcons.location, const GitInfoPage()),
            _setCategory('Other', AppIcons.arrowBack, const OtherPage()),
            _setCategory('Настройки', AppIcons.arrowBack, const SettingsPage()),

            const Spacer(),
            _setCategory(LocaleKeys.aboutUs.tr(), AppIcons.location,
                const AboutUsPage()),
            _setCategory('Logout', AppIcons.location, const HomeScreen(),
                isAll: true),
          ],
        ),
      ),
    );
  }

  ListTile _setCategory(String title, String icon, Widget page,
          {bool isAll = false}) =>
      ListTile(
        onTap: () async {
          if (isAll) {
            await GetStorage().write('token', '');
            CustomNavigator().pushAndRemoveUntil(page);
          } else {
            CustomNavigator.push(page);
          }
        },
        leading: SvgPicture.asset(icon, height: getHeight(32.0)),
        title: Text(
          title,
          style: AppTextStyle.regular(color: AppColors.white, size: 32.0),
        ),
      );
}
