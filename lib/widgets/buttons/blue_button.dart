import 'package:flutter/material.dart';
import 'package:mobileapp/core/components/exporting_packages.dart';

class BlueButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String label;

  const BlueButton({
    Key? key,
    required this.onPressed,
    required this.label,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: AppColors.blue,
      borderRadius: MyBorderRadius.circular(radius: 32.0),
      child: Padding(
        padding: MyEdgeInsets.symmetric(h: 10.0, v: 5.0),
        child: Text(
          label,
          style: AppTextStyle.regular(size: 12.0, color: AppColors.white),
        ),
      ),
    ).onClick(onPressed);
  }
}
