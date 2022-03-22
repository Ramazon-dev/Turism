import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mobileapp/core/components/exporting_packages.dart';
import 'package:mobileapp/core/components/image_filter.dart';
import 'package:mobileapp/screens/details/hotel_details_page.dart';
import 'package:mobileapp/screens/details/restaurant_details_page.dart';
import 'package:mobileapp/services/restaurant_service.dart';
import 'package:mobileapp/widgets/top_bar/app_bar_with_list.dart';

class RestaurantsGridView extends StatefulWidget {
  RestaurantsGridView({Key? key}) : super(key: key);

  @override
  State<RestaurantsGridView> createState() => _RestaurantsGridViewState();
}

class _RestaurantsGridViewState extends State<RestaurantsGridView>
    with TickerProviderStateMixin {
  late TabController _tabController;
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  CityModel _city = CityList.cities[0];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: CityList.cities.length, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBarWithList(
        onPressed: () => Navigator.pop(context),
        tabController: _tabController,
        title: LocaleKeys.hotel.tr(),
        onTabChanged: _onTabChanged,
        icon: Icons.arrow_back_ios_outlined,
      ),
      body: SingleChildScrollView(
        child: FutureBuilder(
            future: RestaurantService().fetchRestaurantsByCity(_city.value),
            builder: (context, AsyncSnapshot<List<Restaurant>?> snap) {
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
                      Restaurant rest = snap.data![i];
                      String img = imageFilter(rest.media![0]);
                      return _buildHotelLayout(img, rest);
                    });
              }
              return SizedBox(
                height: SizeConfig.screenHeight - 200,
                child: const Center(child: CupertinoActivityIndicator()),
              );
            }),
      ),
    );
  }

  void _openDrawer() {
    _scaffoldKey.currentState!.openDrawer();
  }

  void _onTabChanged(i) {
    setState(() {
      _city = CityList.cities[i];
    });
  }

  InkWell _buildHotelLayout(String img, Restaurant rest) {
    return InkWell(
      onTap: () {
        CustomNavigator.push(ResDetailsPage(rest: rest));
      },
      borderRadius: MyBorderRadius.circular(radius: 7.0),
      child: Container(
        alignment: Alignment.bottomCenter,
        decoration: MyDecoration.netImage(
            netImage: img, radius: 7.0, color: AppColors.disabled),
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
                  rest.name!,
                  style: AppTextStyle.medium(color: AppColors.white),
                ),
                Text(
                  rest.site.toString(),
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
