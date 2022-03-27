import 'package:flutter/material.dart';
import 'package:mobileapp/core/components/exporting_packages.dart';
import 'package:mobileapp/core/components/image_filter.dart';
import 'package:mobileapp/models/obekt_model.dart';
import 'package:mobileapp/screens/details/obekt_details.dart';

class PlaceInfoCard extends StatelessWidget {
  final Obekt place;

  const PlaceInfoCard({Key? key, required this.place}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        CustomNavigator.push(ObjectDetailsPage(place: place));
      },
      child: Card(
        margin: EdgeInsets.zero,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: MyBorderRadius.only(topRight: 7.0, topLeft: 7.0),
              child: CachedNetworkImage(
                imageUrl:imageFilter( place.media!.first),
                height: getHeight(200.0),
                width: getWidth(375.0),
                fit: BoxFit.cover,
              ),
            ),
            Padding(
              padding: MyEdgeInsets.all(9.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(place.tell ?? '', style: AppTextStyle.medium(size: 10.0)),
                  MySizedBox(height: 5.0),
                  Text(
                    place.nameRu!,
                    style: AppTextStyle.medium(size: 12.0),
                    maxLines: 2,
                  ),
                  // MySizedBox(height: 1.0),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
