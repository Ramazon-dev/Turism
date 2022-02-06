import 'package:flutter/material.dart';
import 'package:mobileapp/core/components/exporting_packages.dart';
import 'package:mobileapp/widgets/appbar_widget.dart';

class GitDescriptionPage extends StatelessWidget {
  String imageurl;
  String name;
  int price;
  int reyting;
  int users;
  List language;

  List<SvgPicture>? fullStar;

  List<SvgPicture>? emptyStar;

  List<Text>? lang;

  GitDescriptionPage(
      {Key? key,
      required this.imageurl,
      required this.name,
      required this.price,
      required this.reyting,
      required this.users,
      required this.language})
      : super(key: key);

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

    return Scaffold(
      appBar: AppBarWidget(text: 'Git'),
      body: Column(
        children: [
          Center(
            child: Container(
              margin: EdgeInsets.only(top: getHeight(20)),
              height: getHeight(592),
              width: getWidth(345),
              decoration: BoxDecoration(
                border:
                    Border.all(color: AppColors.darkBorder, width: getWidth(1)),
                borderRadius: BorderRadius.all(
                  Radius.circular(
                    getWidth(7),
                  ),
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin: EdgeInsets.all(getWidth(11)),
                    width: getWidth(323),
                    height: getHeight(255),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(
                          Radius.circular(
                            getWidth(5),
                          ),
                        ),
                        image: DecorationImage(
                            image: NetworkImage(imageurl), fit: BoxFit.cover)),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding:
                              EdgeInsets.symmetric(vertical: getHeight(10)),
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
                              color: AppColors.greyPrice,
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
                        Padding(
                          padding:
                              EdgeInsets.symmetric(vertical: getHeight(10)),
                          child: Row(
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
                        ),
                        Row(
                          children: lang!,
                        ),
                        SizedBox(
                          height: getHeight(28),
                        ),
                        const Text(
                          "Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at ",
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            fontFamily: 'Roboto',
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
