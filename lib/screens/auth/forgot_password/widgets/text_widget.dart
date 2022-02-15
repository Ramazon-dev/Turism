import 'package:flutter/material.dart';
import 'package:mobileapp/core/components/size_config.dart';

class TextWidgetPassword extends StatelessWidget {
  String? text;
  TextWidgetPassword({
    Key? key,
    this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text!,
      style: TextStyle(
        fontWeight: FontWeight.w500,
        fontSize: getHeight(15),
        color: const Color(0xff6c6c6c),
      ),
      textAlign: TextAlign.center,
    );
  }
}
