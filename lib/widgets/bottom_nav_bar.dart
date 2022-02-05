import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mobileapp/core/components/exporting_packages.dart';
import 'package:mobileapp/core/constants/app_icons.dart';

class BottomNavBarWidget extends StatelessWidget {
  final ValueChanged<int> onTap;
  final int currentIndex;

  const BottomNavBarWidget({
    Key? key,
    required this.onTap,
    required this.currentIndex,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      onTap: onTap,
      showUnselectedLabels: false,
      showSelectedLabels: false,
      type: BottomNavigationBarType.fixed,
      items: [
        _setItem(AppIcons.git, 0),
        _setItem(AppIcons.search, 1),
        _setItem(AppIcons.home, 2),
        _setItem(AppIcons.car, 3),
        _setItem(AppIcons.personal, 4),
      ],
    );
  }

  BottomNavigationBarItem _setItem(String assetIcon, int index) =>
      BottomNavigationBarItem(
        icon: SvgPicture.asset(
          assetIcon,
          color: currentIndex == index ? AppColors.primary : AppColors.black,
        ),
        label: '',
      );
}
