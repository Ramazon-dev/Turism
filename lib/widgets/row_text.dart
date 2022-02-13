import 'package:flutter/material.dart';
import 'package:mobileapp/core/components/exporting_packages.dart';

class RowTextWidgets extends StatelessWidget {
  final VoidCallback ontab;
  String text;
  String bottomText;
   RowTextWidgets({
     required this.ontab,
    required this.text,
    required this.bottomText,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Padding(
          padding: MyEdgeInsets.all(8.0),
          child: Text(
            text,
            style: TextStyle(fontSize: getWidth(18.0)),
          ),
        ),
        Padding(
          padding: MyEdgeInsets.only(right: 15.0),
          child: InkWell(
            onTap: ontab,
            child: Text(
              bottomText,
              style: TextStyle(fontSize: getWidth(18.0,),color: AppColors.linear),
            ),
          ),
        ),
      ],
    );
  }
}