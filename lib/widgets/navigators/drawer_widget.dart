import 'package:flutter/material.dart';
import 'package:mobileapp/core/components/exporting_packages.dart';
import 'package:mobileapp/screens/about_us_page.dart';

class DrawerWidget extends StatelessWidget {
  const DrawerWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: AppColors.primary,
      child: Column(
        children: [
          _buildContainer(),
          _setCategory(
              LocaleKeys.currency.tr(), AppIcons.dollar, const CurrencyPage()),
          _setCategory(LocaleKeys.settings.tr(), AppIcons.arrowBack,
              const SettingsPage()),
          _setCategory(
              LocaleKeys.aboutUs.tr(), AppIcons.location, const AboutUsPage()),
          _setCategory(
              LocaleKeys.logout.tr(), AppIcons.location, const HomeScreen(),
              isAll: true),
        ],
      ),
    );
  }

  Container _buildContainer() {
    return Container(
      height: 224.h,
      width: 375.w,
      alignment: Alignment.bottomCenter,
      decoration: MyDecoration.netImage(
          netImage: CityList.cities[0].imgUrl, radius: 0.0),
      child: Transform.translate(
        offset: Offset(0.0, 4.h),
        child: Container(
          height: 20.h,
          decoration: BoxDecoration(
              color: AppColors.primary,
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(12.w),
                topLeft: Radius.circular(12.w),
              )),
        ),
      ),
    );
  }

  ListTile _setCategory(String title, String icon, Widget page,
          {bool isAll = false}) =>
      ListTile(
        onTap: () async {
          if (isAll) {
            await AuthServices.logout();
            CustomNavigator().pushAndRemoveUntil(page);
          } else {
            CustomNavigator.push(page);
          }
        },
        title: Text(
          title,
          style: AppTextStyle.regular(color: AppColors.white, size: 24.0),
        ),
      );
}
