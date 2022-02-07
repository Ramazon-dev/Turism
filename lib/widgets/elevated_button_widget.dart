import 'package:flutter/material.dart';
import 'package:mobileapp/core/components/exporting_packages.dart';

class ElevatedButtonWidget extends StatelessWidget {
  String text;
  double height;
  double wigth;
  ElevatedButtonWidget({
    Key? key,
    this.text = 'Enter',
    this.height = 60.0,
    this.wigth = 335,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Container(
      height: height,
      width: wigth,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
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
        text,
        style: TextStyle(
            fontWeight: FontWeight.w400,
            color: AppColors.white,
            fontSize: getHeight(18)),
      ),
    );
  }
}
