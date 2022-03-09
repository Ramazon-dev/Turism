import 'package:flutter/material.dart';
import 'package:mobileapp/core/components/exporting_packages.dart';
import 'package:mobileapp/core/components/my_border_radius.dart';

class ElevatedButtonWidget extends StatelessWidget {
  final VoidCallback onPressed;
  final String label;

  const ElevatedButtonWidget({
    Key? key,
    required this.onPressed,
    required this.label,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: MyBorderRadius.circular(radius: 10.0),
      onTap: onPressed,
      child: Container(
        height: getHeight(60.0),
        width: getWidth(315.0),
        decoration: BoxDecoration(
          borderRadius: MyBorderRadius.circular(radius: 10.0),
          gradient: const LinearGradient(
            colors: [
              AppColors.linear,
              AppColors.linearend,
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        alignment: Alignment.center,
        child: Text(
          label,
          style: TextStyle(
              fontWeight: FontWeight.w400,
              color: AppColors.white,
              fontSize: getWidth(18)),
        ),
      ),
    );
  }
}
