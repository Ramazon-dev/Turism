import 'package:flutter/material.dart';
import 'package:mobileapp/core/components/exporting_packages.dart';
import 'package:mobileapp/core/components/my_border_radius.dart';
import 'package:mobileapp/screens/details/places_details.dart';

class PlaceInfoCard extends StatelessWidget {
  final PlaceModel place;

  const PlaceInfoCard({Key? key, required this.place}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        CustomNavigator.push(PlacesDetailsPage(place: place));
      },
      child: Card(
        margin: EdgeInsets.zero,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: MyBorderRadius.only(topRight: 7.0, topLeft: 7.0),
              child: Image.network(
                place.media.first,
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
                  Text(place.phone, style: TextWidget.medium(size: 10.0)),
                  MySizedBox(height: 5.0),
                  Text(place.name, style: TextWidget.medium(size: 12.0)),
                  MySizedBox(height: 19.0),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
