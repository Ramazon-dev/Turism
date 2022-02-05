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
          )),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          primary: Colors.transparent,
          elevation: 0,
          fixedSize: Size(
            getWidth(wigth),
            getHeight(height),
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        onPressed: () {
          print('pressed');
        },
        child: Text(text),
      ),
    );
  }
}
