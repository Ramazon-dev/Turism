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
          RatWidget(rating: rating, users: users),
          Container(
            width: getWidth(178),
            child: Text(
              name,
              overflow: TextOverflow.ellipsis,
              maxLines: 2,
              style: TextStyle(
                fontSize: getWidth(14),
                fontWeight: FontWeight.w500,
                fontFamily: 'Roboto',
              ),
            ),
          ),
          Row(
            children: [
              SvgPicture.asset(AppIcons.call),
              SizedBox(
                width: getWidth(4),
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
          Row(
            children: [
              SvgPicture.asset(AppIcons.location),
              SizedBox(
                width: getWidth(4),
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
                width: getWidth(4),
              ),
              UrlTextWidget(
                url: site,
                text: '$site',
              )
            ],
          ),
        ],
      ),
    );
  }
}
