import 'package:flutter/material.dart';

class AppBarWidget extends StatelessWidget with PreferredSizeWidget {
  final String? text;
  final Widget? leading;
  final Widget? actions;
  const AppBarWidget({
    Key? key,
    this.text,
    this.leading,
    this.actions,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(text!),
      leading: leading,
      actions: [actions!],
    );
  }

  @override
  Size get preferredSize => throw Size(double.infinity, 99);
}
