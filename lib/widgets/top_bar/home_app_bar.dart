import 'package:flutter/material.dart';
import 'package:mobileapp/core/components/exporting_packages.dart';

class HomeAppBar extends StatelessWidget with PreferredSizeWidget {
  const HomeAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: IconButton(
        onPressed: () {},
        icon: const Icon(Icons.menu),
      ),
      actions: [
        PopupMenuButton(

            itemBuilder: (_) {
          return [];
        })
      ],
    );
  }

  @override
  Size get preferredSize => Size(double.infinity, 80.h);
}
