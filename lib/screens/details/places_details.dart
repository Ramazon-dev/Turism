import 'package:flutter/material.dart';
import 'package:mobileapp/core/components/exporting_packages.dart';
import 'package:mobileapp/widgets/rating_widget.dart';
import 'package:mobileapp/widgets/url_text_widgte.dart';

class PlacesDetailsPage extends StatelessWidget {
  final PlaceModel place;

  const PlacesDetailsPage({Key? key, required this.place}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            height: getHeight(410),
            width: getWidth(375),
            decoration: MyDecoration.netImage(netImage: place.media[0]),
          ),
          Padding(
            padding: MyEdgeInsets.all(15.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                RatWidget(rating: place.rating, users: 5),
                MySizedBox(height: 4.0),
                Text(
                  place.name,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                  style: TextWidget.medium(size: 18.0),
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
                    MySizedBox(height: 15.0),
                    Text(
                      place.phone,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,
                      style: TextWidget.medium(),
                    ),
                  ],
                ),
                MySizedBox(height: 5.0),
                Row(
                  children: [
                    SvgPicture.asset(AppIcons.location),
                    SizedBox(
                      width: getWidth(15),
                    ),
                    UrlTextWidget(
                      url: place.map,
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
                      url: place.site,
                      text: place.site,
                    )
                  ],
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: getHeight(9.5)),
                  child: Divider(
                    thickness: getWidth(1),
                  ),
                ),
                Text(
                  place.description,
                  style: TextWidget.regular(),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
