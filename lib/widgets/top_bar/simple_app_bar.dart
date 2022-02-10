import 'package:flutter/material.dart';
import 'package:mobileapp/core/components/exporting_packages.dart';

class SimpleAppBar extends StatelessWidget with PreferredSizeWidget {
  final String title;

  const SimpleAppBar({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) => AppBar(
        title: Text(title),
        backgroundColor: AppColors.primary,
      );

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size(double.infinity, getHeight(52.0));
}
