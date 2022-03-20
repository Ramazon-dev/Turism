import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mobileapp/core/components/exporting_packages.dart';
import 'package:mobileapp/screens/details/hotel_details_page.dart';
import 'package:mobileapp/widgets/top_bar/app_bar_with_list.dart';

// TODO: This page must be written with state management
class HotelListPage extends StatefulWidget {
  const HotelListPage({Key? key}) : super(key: key);

  @override
  State<HotelListPage> createState() => _HotelListPageState();
}

class _HotelListPageState extends State<HotelListPage>
    with TickerProviderStateMixin {
  late TabController _tabController;
  CityModel _city = CityList.cities[0];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: CityList.cities.length, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWithList(
          tabController: _tabController,
          onTabChanged: (i) {
            setState(() {
              _city = CityList.cities[i];
            });
          }),
      body: SingleChildScrollView(
        child: FutureBuilder(
            future: HotelService().fetchHotelsByCity(_city.value),
            builder: (context, AsyncSnapshot<List<Hotel>> snap) {
              if (snap.hasError) {
                return const Text('Error');
              } else if (snap.hasData) {
                if (snap.data!.isEmpty) {
                  return const EmptyPageWidget();
                }

                return GridView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    padding: MyEdgeInsets.symmetric(h: 15.0, v: 20.0),
                    gridDelegate: _gridDelegate(),
                    itemCount: snap.data!.length,
                    itemBuilder: (ctx, i) {
                      Hotel hotel = snap.data![i];
                      String img = hotel.media[0]
                          .toString()
                          .replaceAll('k__image__', '');

                      return _buildHotelLayout(img, hotel);
                    });
              }
              return const CupertinoActivityIndicator();
            }),
      ),
    );
  }

  InkWell _buildHotelLayout(String img, Hotel hotel) {
    return InkWell(
      onTap: () {
        CustomNavigator.push(ResHotelDetailsPage(hotel: hotel));
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
                  hotel.name,
                  style: AppTextStyle.medium(color: AppColors.white),
                ),
                Text(
                  hotel.site.toString(),
                  maxLines: 1,
                  style: AppTextStyle.medium(color: AppColors.grey),
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
