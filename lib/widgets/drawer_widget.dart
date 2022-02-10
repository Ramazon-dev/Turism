import 'package:flutter/material.dart';
import 'package:mobileapp/core/components/exporting_packages.dart';
import 'package:mobileapp/screens/details/transport_details.dart';

class DrawerWidget extends StatelessWidget {
  const DrawerWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Drawer(
      backgroundColor: AppColors.primary,
      child: ListView(
        children: [
          _setCategory(
            'Currency',
            AppIcons.dollar,
            TransportDetailPage(car: MockData.carModel),
          ),
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
