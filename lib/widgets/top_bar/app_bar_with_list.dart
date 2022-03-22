import 'package:flutter/material.dart';
import 'package:mobileapp/core/components/exporting_packages.dart';
import 'package:mobileapp/widgets/buttons/app_icon_button.dart';

// ignore: must_be_immutable
class AppBarWithList extends StatelessWidget with PreferredSizeWidget {
  final TabController tabController;
  final ValueChanged<int> onTabChanged;
  final String title;
  final VoidCallback onPressed;
  IconData icon;

  AppBarWithList({
    Key? key,
    required this.tabController,
    required this.onTabChanged,
    required this.title,
    required this.onPressed,
    this.icon = Icons.menu,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 1.0,
      centerTitle: true,
      leading: IconButton(
        onPressed: onPressed,
        icon: Icon(icon),
      ),
      backgroundColor: AppColors.primary,
      title: Text(
        title,
        style: AppTextStyle.medium(size: 18.0, color: AppColors.white),
      ),
      actions: [
        AppIconButton(onPressed: () {}, assetIcon: AppIcons.search),
      ],
      bottom: PreferredSize(
        preferredSize: Size(double.infinity, 80.h),
        child: Container(
          height: 67.h,
          color: AppColors.white,
          alignment: Alignment.center,
          child: TabBar(
            controller: tabController,
            onTap: onTabChanged,
            isScrollable: true,
            padding: MyEdgeInsets.symmetric(h: 20.0, v: 10.0),
            indicatorColor: AppColors.greyPrice,
            unselectedLabelColor: AppColors.greyPrice,
            indicator: MyDecoration.circular(
              color: AppColors.greyPrice,
              radius: 21.w,
            ),
            tabs: CityList.cities.map((e) => Tab(text: e.name)).toList(),
          ),
        ),
      ),
    );
  }

  @override
  Size get preferredSize => Size(double.infinity, 120.h);
}
