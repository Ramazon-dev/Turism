import 'package:flutter/material.dart';
import 'package:mobileapp/core/components/exporting_packages.dart';

class PlacesDetailsPage extends StatelessWidget {
  final PlaceModel place;

  const PlacesDetailsPage({Key? key, required this.place}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        actions: [
          IconButton(
            onPressed: () {},
            icon: SvgPicture.asset(
              AppIcons.link,
              color: AppColors.white,
            ),
          ),
        ],
      ),
      floatingActionButton: _commentButton(),
      body: SingleChildScrollView(
        child: Column(
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
                    style: AppTextStyle.medium(size: 18.0),
                  ),
                  MySizedBox(height: 17.0),
                  _buildLink(AppIcons.call, place.phone,
                      'tel:${place.phone.replaceAll('-', '')}',
                      labelColor: AppColors.black),
                  MySizedBox(height: 10.0),
                  _buildLink(
                    AppIcons.location,
                    'Расположение на карте',
                    place.map,
                    iconColor: AppColors.red,
                  ),
                  MySizedBox(height: 10.0),
                  _buildLink(AppIcons.link, place.site, place.site),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: getHeight(9.5)),
                    child: Divider(
                      thickness: getWidth(1),
                    ),
                  ),
                  Text(
                    place.description,
                    style: AppTextStyle.regular(height: 2.1),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Row _buildLink(
    String assetIcon,
    String label,
    String link, {
    Color iconColor = AppColors.black,
    Color labelColor = AppColors.linkColor,
  }) {
    return Row(
      children: [
        SvgPicture.asset(assetIcon, height: getHeight(15.0), color: iconColor),
        MySizedBox(width: 15.0),
        UrlTextWidget(text: label, url: link, color: labelColor)
      ],
    );
  }

  FloatingActionButton _commentButton() => FloatingActionButton(
        onPressed: () {},
        backgroundColor: AppColors.black,
        child: SvgPicture.asset(AppIcons.comment),
      );
}
