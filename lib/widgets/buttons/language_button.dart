import 'package:flutter/material.dart';
import 'package:mobileapp/core/components/size_config.dart';
import 'package:mobileapp/core/constants/app_colors.dart';

class LanguageWidget extends StatelessWidget {
  List language;

  LanguageWidget({Key? key, required this.language}) : super(key: key);
  List<Widget>? lang;

  @override
  Widget build(BuildContext context) {
    lang = List.generate(
      language.length,
      (i) {
        return Row(
          children: [
            const CircleAvatar(
              backgroundColor: AppColors.greyPrice,
              radius: 3,
            ),
            const SizedBox(width: 3),
            Text(
              '${language[i]} ',
              style: TextStyle(
                color: AppColors.black,
                fontWeight: FontWeight.w900,
                fontSize: getWidth(12),
              ),
            ),
            const SizedBox(width: 7),
          ],
        );
      },
    );

    return Container(
      padding: EdgeInsets.all(getWidth(6)),
      decoration: const BoxDecoration(
          // color: AppColors.greyPrice,
          ),
      child: Row(children: lang!),
    );
  }
}
