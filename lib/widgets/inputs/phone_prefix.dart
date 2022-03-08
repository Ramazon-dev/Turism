import 'package:flutter/material.dart';
import 'package:mobileapp/core/components/exporting_packages.dart';

class PhonePrefix extends StatelessWidget {
  const PhonePrefix({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        alignment: Alignment.center,
        width: 48.w,
        margin: MyEdgeInsets.symmetric(h: 6.0),
        decoration: MyDecoration.circular(radius: 6.0),
        child: Text('+998', style: TextStyle(fontSize: getWidth(16.0))));
  }
}
