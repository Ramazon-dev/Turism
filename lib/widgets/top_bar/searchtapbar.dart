import 'package:flutter/material.dart';
import 'package:mobileapp/core/components/exporting_packages.dart';
import 'package:mobileapp/core/constants/app_colors.dart';

class SearchTabBar extends StatelessWidget with PreferredSizeWidget {
  SearchTabBar({
    Key? key,
  }) : super(key: key);
 
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 0.1,
    );
  }

  @override
  Size get preferredSize => const Size(double.infinity, 90);
}
