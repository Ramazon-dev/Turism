import 'package:flutter/material.dart';
import 'package:mobileapp/core/components/exporting_packages.dart';
import 'base_business_tile.dart';
import 'package:mobileapp/models/business_account_model.dart' as bm;

class BusinessHotelTile extends StatelessWidget {
  final bm.Hotels hotels;

  const BusinessHotelTile({Key? key, required this.hotels}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseBusinessTile(
      // TODO: Bu yerga Hotel rasmi qo'yiladi
      imgUrl: MockData.place.media[0],
      title: hotels.id!.substring(0, 15),
      infoWidget: Column(
        children: [

        ],
      ),
    );
  }
}
