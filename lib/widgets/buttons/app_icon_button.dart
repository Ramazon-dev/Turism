import 'package:flutter/material.dart';
import 'package:mobileapp/core/components/exporting_packages.dart';

class AppIconButton extends StatelessWidget {
  final String assetIcon;
  final VoidCallback onPressed;

  const AppIconButton({
    Key? key,
    required this.onPressed,
    required this.assetIcon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
        onPressed: onPressed,
        icon: SvgPicture.asset(
          assetIcon,
          color: AppColors.white,
        ));
  }
}
