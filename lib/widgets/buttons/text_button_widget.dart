import 'package:flutter/material.dart';
import 'package:mobileapp/core/components/exporting_packages.dart';

class TextButtonWidget extends StatelessWidget {
  final VoidCallback onPressed;
  final String label;

  const TextButtonWidget({
    Key? key,
    required this.onPressed,
    required this.label,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      child: Text(label),
      style: TextButton.styleFrom(
        primary: AppColors.blue,
      ),
    );
  }
}
