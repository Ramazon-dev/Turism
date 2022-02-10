import 'package:flutter/material.dart';
import 'package:mobileapp/core/components/exporting_packages.dart';
import 'package:mobileapp/widgets/rating_widget.dart';
import 'package:mobileapp/widgets/url_text_widgte.dart';

class PlacesDedailsPage extends StatelessWidget {
  String imageurl;
  String name;
  int price;
  double rating;
  int users;
  String karta;
  String site;
  PlacesDedailsPage(
      {Key? key,
      required this.imageurl,
      required this.name,
      required this.price,
      required this.rating,
      required this.users,
      required this.karta,
      required this.site})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            height: getHeight(410),
            width: getWidth(375),
            decoration: const BoxDecoration(
                image: DecorationImage(
                    image: NetworkImage(
                        'https://media.istockphoto.com/photos/parashute-over-daytona-picture-id92158996?b=1&k=20&m=92158996&s=170667a&w=0&h=vyP4G01j5Kloq9-hNTe9_hIg-DyoriL00fDlwR0jsfs='),
                    fit: BoxFit.cover)),
          ),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                RatWidget(rating: rating, users: users),
                SizedBox(
                  height: getHeight(4),
                ),
                Text(
                  name,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                  style: TextStyle(
                    fontSize: getWidth(18),
                    fontWeight: FontWeight.w500,
                    fontFamily: 'Roboto',
                  ),
                ),
                SizedBox(
                  height: getHeight(17),
                ),
                Row(
                  children: [
                    SvgPicture.asset(
                      AppIcons.call,
                      color: AppColors.black,
                    ),
                    SizedBox(
                      width: getWidth(15),
                    ),
                    Text(
                      '+998971881799',
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,
                      style: TextStyle(
                        fontSize: getWidth(14),
                        fontWeight: FontWeight.w500,
                        fontFamily: 'Roboto',
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: getHeight(5),
                ),
                Row(
                  children: [
                    SvgPicture.asset(AppIcons.location),
                    SizedBox(
                      width: getWidth(15),
                    ),
                    UrlTextWidget(
                      url: karta,
                      text: 'Расположение на карте',
                    )
                  ],
                ),
                SizedBox(
                  height: getHeight(4),
                ),
                Row(
                  children: [
                    SvgPicture.asset(AppIcons.link),
                    SizedBox(
                      width: getWidth(15),
                    ),
                    UrlTextWidget(
                      url: site,
                      text: '$site',
                    )
                  ],
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: getHeight(9.5)),
                  child: Divider(
                    thickness: getWidth(1),
                  ),
                ),
                const Text(
                  "Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at ",
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    fontFamily: 'Roboto',
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
