import 'package:flutter/material.dart';
import 'package:mobileapp/core/components/exporting_packages.dart';

class AppBarOrigin extends StatelessWidget with PreferredSizeWidget {
  String text;
  late Widget actions;
  late Widget actions2;
  Color color;
  AppBarOrigin({
    Key? key,
    required this.actions,
    required this.actions2,
    this.color = AppColors.primary,
    this.text = '',
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      toolbarHeight: 90,
      centerTitle: true,
      actions: [
        actions,
        const SizedBox(width: 10),
      ],
      title: Text(text),
      backgroundColor: color,
    );
  }

  @override
  Size get preferredSize => const Size(double.infinity, 90);
}
