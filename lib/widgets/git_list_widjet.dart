import 'package:flutter/material.dart';
import 'package:mobileapp/core/components/exporting_packages.dart';
import 'package:mobileapp/widgets/description_widjet.dart';
import 'package:mobileapp/widgets/buttons/language_button.dart';

class MyGitListWidjet extends StatelessWidget {
  final Git git;

  MyGitListWidjet({Key? key, required this.git}) : super(key: key);
  List<SvgPicture>? fullStar;
  List<SvgPicture>? emptyStar;

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Container(
      margin: EdgeInsets.only(
          top: getHeight(20), left: getWidth(15), right: getWidth(15)),
      padding: EdgeInsets.all(getWidth(9)),
      width: getWidth(345),
      height: getHeight(134),
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.darkCyan, width: getWidth(1)),
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
            decoration: BoxDecoration(
                borderRadius: BorderRadius.all(
                  Radius.circular(
                    getWidth(5),
                  ),
                ),
                image: DecorationImage(
                    image: NetworkImage(git.image), fit: BoxFit.cover)),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              DescriptionWidget(
                name: git.informEn.toString(),
                price: int.parse(git.price.toString()),
                rating: git.reyting!.toDouble(),
                users: 8,
              ),
              LanguageWidget(language: git.languages)
            ],
          ),
        ],
      ),
    );
  }
}
