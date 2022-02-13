import 'package:flutter/material.dart';
import 'package:mobileapp/core/components/exporting_packages.dart';

class StartBar extends StatelessWidget {
  double son;
   StartBar({
    required this.son,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    
    return Padding(
      padding: MyEdgeInsets.all(8),
      child: Container(
        alignment: Alignment.center,
        height: getHeight(22.0),
        width: getWidth(51.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(
            getWidth(10),
          ),
          color: AppColors.starAreaColor,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(
              AppIcons.star,
              color: AppColors.yellow,
              height: getHeight(16.0),
              width: getWidth(16.0),
            ),
            Text(son.toString(),style: TextStyle(fontSize: getWidth(12.0)),)
          ],
        ),
      ),
    );
  }
}