import 'package:flutter/material.dart';
import 'package:mobileapp/core/components/exporting_packages.dart';
import 'package:mobileapp/screens/restaurant/restaurants_grid_view.dart';

class SelectedCityPage extends StatelessWidget {
  CityModel city;

  SelectedCityPage({Key? key, required this.city}) : super(key: key);
  List<String> listOfStrings = [
    '${LocaleKeys.tourist_zone.tr()}.',
    '${LocaleKeys.git.tr()}.',
    '${LocaleKeys.transport.tr()}.',
    '${LocaleKeys.hotel.tr()}.',
    '${LocaleKeys.restaurant.tr()}.',
  ];

  @override
  Widget build(BuildContext context) {
    List<Widget> listOfPages = [
      PlacePage(
        city: city.value,
        category: "",
      ),
      const GitPage(),
      const CarPage(),
      HotelListPage(),
      RestaurantsGridView(),
    ];
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: MyDecoration.netImage(netImage: city.imgUrl),
        child: Container(
          margin: EdgeInsets.symmetric(
            horizontal: getWidth(15),
            vertical: getHeight(116),
          ),
          padding: EdgeInsets.all(getHeight(22)),
          height: getHeight(576),
          width: getWidth(345),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: Colors.white.withOpacity(0.5),
          ),
          child: Column(
            children: [
              Text(
                LocaleKeys.service_area_in.tr(args: [city.name]),
                style: AppTextStyle.bold(size: getHeight(20)),
              ),
              SizedBox(height: getHeight(50)),
              SizedBox(
                height: getHeight(350),
                width: getWidth(302),
                child: ListView.builder(
                    padding: EdgeInsets.zero,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: listOfStrings.length,
                    itemBuilder: (context, index) {
                      return Container(
                        margin: EdgeInsets.only(bottom: getHeight(10)),
                        child: elevatedButton(
                          listOfStrings[index],
                          context,
                          listOfPages[index],
                        ),
                      );
                    }),
              ),
            ],
          ),
        ),
      ),
    );
  }

  ElevatedButton elevatedButton(
      String text, BuildContext context, Widget page) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        primary: Colors.white,
        fixedSize: Size(getWidth(301), getHeight(60)),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => page,
          ),
        );
      },
      child: Text(
        text,
        style: AppTextStyle.regular(size: getHeight(16)),
      ),
    );
  }
}
