import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mobileapp/core/components/exporting_packages.dart';
import 'package:mobileapp/core/components/my_border_radius.dart';
import 'package:mobileapp/screens/details/hotel_details_page.dart';
import 'package:mobileapp/services/hotel_service.dart';

class HotelListPage extends StatelessWidget {
  const HotelListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const SimpleAppBar(title: 'Hotel'),
      body: FutureBuilder(
          future: HotelService().fetchHotelsByCity('toshkent'),
          builder: (context, AsyncSnapshot<List<Hotel>> snap) {
            if (snap.hasError) {
              return const Text('Error');
            } else if (snap.hasData) {
              return GridView.builder(
                  padding: MyEdgeInsets.symmetric(h: 15.0, v: 20.0),
                  gridDelegate: _gridDelegate(),
                  itemCount: snap.data!.length,
                  itemBuilder: (ctx, i) {
                    Hotel hotel = snap.data![i];
                    String img =
                        hotel.media[0].toString().replaceAll('k__image__', '');
                    return _buildHotelLayout(img, hotel);
                  });
            }
            return const CupertinoActivityIndicator();
          }),
    );
  }

  InkWell _buildHotelLayout(String img, Hotel hotel) {
    return InkWell(
      onTap: () {
        CustomNavigator().push(ResHotelDetailsPage(hotel: hotel));
      },
      borderRadius: MyBorderRadius.circular(radius: 7.0),
      child: Container(
        alignment: Alignment.bottomCenter,
        decoration: MyDecoration.netImage(netImage: img, radius: 7.0),
        child: GlassContainer(
          width: getWidth(375.0),
          height: getHeight(64.0),
          borderRadius: MyBorderRadius.circular(radius: 7.0),
          child: Padding(
            padding: MyEdgeInsets.symmetric(h: 5.0, v: 12.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  hotel.nameUz,
                  style: TextWidget.medium(color: AppColors.white),
                ),
                Text(
                  hotel.site,
                  maxLines: 1,
                  style: TextWidget.medium(color: AppColors.grey),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  SliverGridDelegateWithFixedCrossAxisCount _gridDelegate() {
    return SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: getHeight(20.0),
        crossAxisSpacing: getWidth(15.0),
        childAspectRatio: 0.7);
  }
}
