import 'package:flutter/material.dart';
import 'package:mobileapp/core/components/exporting_packages.dart';

class AppBarWidget extends StatelessWidget {
  final String text;
  final Widget leading;
  final Widget actions;
  final Widget actions2;
  final Color color;
  final double elevation;
  AppBarWidget({
    Key? key,
    this.text = '',
    this.leading = const Icon(Icons.arrow_back),
    this.actions = const Icon(Icons.style),
    this.color = Colors.transparent,
    this.elevation = 1,
    this.actions2 = const Icon(Icons.language),
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.bottomCenter,
      width: MediaQuery.of(context).size.width,
      height: 90,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [
            AppColors.linear,
            AppColors.linearend,
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            leading,
            Text(text),
            Row(
              children: [
                actions,
                SizedBox(width: getWidth(10)),
                actions2,
              ],
            ),
          ],
        ),
      ),
    );
  }

  // @override
  // Size get preferredSize => const Size(double.infinity, 90);
}
