import 'package:flutter/material.dart';
import 'package:mobileapp/core/components/exporting_packages.dart';

class LetsGo extends StatelessWidget {
  final Color color;
  final String text;

  const LetsGo({
    Key? key,
    required this.text,
    required this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        MySizedBox(height: 50.0),
        Padding(
          padding: MyEdgeInsets.only(left: 30.0),
          child: TextWidget(
            'ДАВАЙТЕ',
            style: TextWidget.bold(
              color: AppColors.primary,
            ),
          ),
        ),
        MySizedBox(height: 11.0),
        Row(
          children: [
            _setDivider(213.0),
            _setDivider(44.0),
            _setDivider(25.0),
          ],
        ),
        Padding(
          padding: MyEdgeInsets.only(top: 25.0, left: 30.0, right: 30.0),
          child: TextWidget(
            text,
            style: TextWidget.regular(
              color: color,
              size: 45.0,
            ),
          ),
        ),
      ],
    );
  }

  SizedBox _setDivider(double width) => SizedBox(
        width: width,
        child: Divider(
          height: getHeight(1.0),
          color: AppColors.grey,
          thickness: getHeight(1.0),
          endIndent: getWidth(10.0),
        ),
      );
}
