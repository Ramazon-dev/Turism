import 'package:flutter/material.dart';
import 'package:mobileapp/core/components/exporting_packages.dart';

class AppBarWidget extends StatelessWidget with PreferredSizeWidget {
  final String? text;
  final Widget? leading;
  final List<Widget>? actions;
  final Color? color;
  final double elevation;
  const AppBarWidget({
    Key? key,
    this.text,
    this.leading,
    this.actions,
    this.color = AppColors.primary,
    this.elevation = 1,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return AppBar(
      foregroundColor: Colors.black,
      backgroundColor: color,
      elevation: elevation,
      title: Text(
        text!,
        style: const TextStyle(
          color: Colors.white,
        ),
      ),
      toolbarHeight: 120,
      centerTitle: true,
      leading: leading,
      actions: actions,
    );
  }

  @override
  Size get preferredSize => const Size(double.infinity, 90);
}
