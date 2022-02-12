import 'package:flutter/material.dart';
import 'package:mobileapp/core/components/exporting_packages.dart';
import 'package:mobileapp/core/components/my_border_radius.dart';

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
    return InkWell(
      onTap: onPressed,
      splashColor: AppColors.grey,
      borderRadius: MyBorderRadius.circular(radius: 32.0),
      child: Material(
        color: AppColors.blue,
        borderRadius: MyBorderRadius.circular(radius: 32.0),
        child: Container(
          padding: MyEdgeInsets.symmetric(h: 10.0, v: 5.0),
          // decoration: MyDecoration.circular(color: AppColors.blue, radius: 32.0),
          child: Text(
            label,
            style: TextWidget.regular(size: 12.0, color: AppColors.white),
          ),
        ),
      ),
    );
  }
}
