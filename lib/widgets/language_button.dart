import 'package:flutter/material.dart';
import 'package:mobileapp/core/components/size_config.dart';
import 'package:mobileapp/core/constants/app_colors.dart';

class LanguageWidget extends StatelessWidget {
  List language;
  LanguageWidget({Key? key, required this.language}) : super(key: key);
  List<Text>? lang;
  @override
  Widget build(BuildContext context) {
    lang = List.generate(language.length, (i) {
      return Text(
        '${language[i]}, ',
        style: TextStyle(color: AppColors.white, fontSize: getWidth(12)),
      );
    });
    SizeConfig().init(context);
    return Container(
      padding: EdgeInsets.all(getWidth(6)),
      decoration: BoxDecoration(
          color: AppColors.greyPrice,
          borderRadius:
              BorderRadius.all(Radius.circular(getWidth(getWidth(6))))),
      child: Row(
        children: lang!,
      ),
    );
  }
}
