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
    return ElevatedButton(
      onPressed: () {},
      child: Text(
        label,
        style: TextWidget.regular(size: 12.0, color: AppColors.white),
      ),
      style: ElevatedButton.styleFrom(
        padding: MyEdgeInsets.symmetric(h: 10.0, v: 5.0),
        primary: AppColors.blue,
        elevation: 0.0,
        shape: RoundedRectangleBorder(
          borderRadius: MyBorderRadius.circular(radius: 32.0),
        )
      ),
    );
  }
}
