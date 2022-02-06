import 'package:flutter/material.dart';
import 'package:mobileapp/core/components/exporting_packages.dart';

class MyGitListWidjet extends StatelessWidget {
  String imageUrl;
  String name;
  int price;
  int reyting;
  int users;
  List language;

  MyGitListWidjet(
      {Key? key,
      required this.imageUrl,
      required this.name,
      required this.price,
      required this.reyting,
      required this.users,
      required this.language})
      : super(key: key);
  List<SvgPicture>? fullStar;
  List<Text>? lang;
  List<SvgPicture>? emptyStar;
  @override
  Widget build(BuildContext context) {
    fullStar = List.generate(reyting, (index) {
      return SvgPicture.asset('assets/icons/fullStar.svg');
    });
    emptyStar = List.generate(5 - reyting, (index) {
      return SvgPicture.asset('assets/icons/fullStar.svg');
    });
    lang = List.generate(language.length, (i) {
      return Text(
        '${language[i]}, ',
        style: TextStyle(color: AppColors.grey, fontSize: getWidth(12)),
      );
    });
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
                    image: NetworkImage(imageUrl), fit: BoxFit.cover)),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: getWidth(178),
                child: Text(
                  name,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    fontFamily: 'Roboto',
                  ),
                ),
              ),
              RichText(
                  text: TextSpan(children: [
                TextSpan(
                  text: '$price\$',
                  style: const TextStyle(
                    color: AppColors.grey,
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    fontFamily: 'Roboto',
                  ),
                ),
                const TextSpan(
                  text: '/1 kunga',
                  style: TextStyle(
                    color: AppColors.black,
                    fontSize: 10,
                    fontWeight: FontWeight.w400,
                    fontFamily: 'Roboto',
                  ),
                )
              ])),
              Row(
                children: [
                  Row(
                    children: fullStar!,
                  ),
                  Row(
                    children: emptyStar!,
                  ),
                  Text(
                    reyting == 0 ? '' : '$reyting ($users)',
                    style: const TextStyle(
                        fontSize: 12,
                        fontFamily: 'Roboto',
                        fontWeight: FontWeight.w500),
                  ),
                ],
              ),
              Row(
                children: lang!,
              )
            ],
          ),
        ],
      ),
    );
  }
}
