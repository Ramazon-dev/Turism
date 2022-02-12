import 'package:flutter/material.dart';
import 'package:mobileapp/core/components/exporting_packages.dart';
import 'package:mobileapp/widgets/cards/place_info_card.dart';

class PlacePage extends StatelessWidget {
  const PlacePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const SimpleAppBar(title: 'Places'),
      body: GridView.builder(
        padding: MyEdgeInsets.symmetric(h: 15.0, v: 22.0),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: getHeight(20.0),
            crossAxisSpacing: getWidth(15.0),
            mainAxisExtent: getHeight(284.0)
          ),
          itemBuilder: (ctx, i) {
            return PlaceInfoCard(place: MockData.place);
          }),
    );
  }
}
