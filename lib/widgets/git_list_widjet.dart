import 'package:flutter/material.dart';
import 'package:mobileapp/core/components/exporting_packages.dart';
import 'package:mobileapp/core/components/image_filter.dart';
import 'package:mobileapp/widgets/description_widjet.dart';
import 'package:mobileapp/widgets/buttons/language_button.dart';

class MyGitListWidget extends StatelessWidget {
  final Git git;

  const MyGitListWidget({Key? key, required this.git}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        top: getHeight(20),
        left: getWidth(15),
        right: getWidth(15),
      ),
      padding: EdgeInsets.all(getWidth(9)),
      width: getWidth(345),
      height: getHeight(134),
      decoration: BoxDecoration(
        border: Border.all(
          color: AppColors.darkCyan,
          width: getWidth(1),
        ),
        borderRadius: BorderRadius.all(
          Radius.circular(
            getWidth(7),
          ),
        ),
      ),
      child: Row(
        children: [
          Container(
            margin: EdgeInsets.only(right: getWidth(9)),
            width: getWidth(128),
            height: getHeight(116),
            decoration: MyDecoration.netImage(netImage: git.image != null ? imageFilter(git.image!): 'default'),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              DescriptionWidget(
                name: git.username ?? 'Your account',
                price: git.price.toString(),
                rating: git.reyting!.toDouble(),
                users: 8,
              ),
              LanguageWidget(language: git.languages!)
            ],
          ),
        ],
      ),
    );
  }
}
