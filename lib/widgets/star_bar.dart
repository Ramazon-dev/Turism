import 'package:flutter/material.dart';
import 'package:mobileapp/core/components/exporting_packages.dart';

class StartBar extends StatelessWidget {
  double son;
  int? kishi;
   StartBar({
    required this.son,
    this.kishi,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    
    return Container(
      padding: EdgeInsets.symmetric(horizontal:8.w, vertical: 8.0),
      alignment: Alignment.centerRight,
      decoration: BoxDecoration(
        
        borderRadius: BorderRadius.circular(
          getWidth(10),
        ),
        color: AppColors.starAreaColor.withOpacity(0.7),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          SvgPicture.asset(
            AppIcons.star,
            color: AppColors.yellow,
            height: getHeight(16.0),
            width: getWidth(16.0),
          ),
          Text(son.toString(),style: TextStyle(fontSize: getWidth(12.0)),
          
          ),
          if( son != 0.0) Text(' ($kishi)',style: TextStyle(fontSize: getWidth(12.0)),
          
          ),
        ],
      ),
    );
  }
}