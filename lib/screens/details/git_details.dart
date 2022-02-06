import 'package:flutter/material.dart';
import 'package:mobileapp/core/components/exporting_packages.dart';
import 'package:mobileapp/widgets/appbar_origin.dart';
import 'package:mobileapp/widgets/appbar_widget.dart';
<<<<<<< HEAD:lib/screens/details/git_details.dart
import 'package:mobileapp/widgets/contact_widget.dart';
import 'package:mobileapp/widgets/description_widjet.dart';
import 'package:mobileapp/widgets/language_button.dart';
=======
import 'package:mobileapp/widgets/drawer_widget.dart';
>>>>>>> main:lib/screens/git/git_desciription.dart

class GitDescriptionPage extends StatelessWidget {
  String imageurl;
  String name;
  int price;
  double rating;
  int users;
  List language;

  GitDescriptionPage(
      {Key? key,
      required this.imageurl,
      required this.name,
      required this.price,
      required this.rating,
      required this.users,
      required this.language})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    return Scaffold(
      appBar: AppBarOrigin(
        actions: SvgPicture.asset(AppIcons.language),
        actions2: SvgPicture.asset(AppIcons.dollar),
      ),
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
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            DescriptionWidget(
                                name: name,
                                price: price,
                                rating: rating,
                                users: users),
                            LanguageWidget(language: language),
                          ],
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
                        ),
                        ContactWidget(),
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
