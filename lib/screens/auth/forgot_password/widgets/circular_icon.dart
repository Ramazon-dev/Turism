import 'package:flutter/material.dart';
import 'package:mobileapp/core/components/exporting_packages.dart';
import 'package:mobileapp/core/components/size_config.dart';

class CircularIcon extends StatelessWidget {
  const CircularIcon({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      height: getHeight(192),
      width: getWidth(192),
      // padding: EdgeInsets.all(30),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(92),
        color: const Color(0xffFFF3EC),
      ),
      child: SvgPicture.asset(
        'assets/images/icons.svg',
        // color: Colors.yellow,
        height: getHeight(120),
      ),
    );
  }
}
