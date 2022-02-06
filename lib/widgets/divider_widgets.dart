import 'package:flutter/material.dart';
import 'package:mobileapp/core/components/exporting_packages.dart';

class dividerWidget extends StatelessWidget {
  const dividerWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Divider(endIndent: getWidth(14.0),indent: getWidth(14.0),);
  }
}