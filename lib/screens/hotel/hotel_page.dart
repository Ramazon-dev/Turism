import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mobileapp/core/components/exporting_packages.dart';
import 'package:mobileapp/core/components/image_filter.dart';
import 'package:mobileapp/screens/details/hotel_details_page.dart';
import 'package:mobileapp/widgets/top_bar/app_bar_with_list.dart';

// TODO: This page must be written with state management
class HotelListPage extends StatefulWidget {
  final String ctgId;
  CityModel changedCity;

   HotelListPage({Key? key, required this.ctgId, required this.changedCity}) : super(key: key);

  @override
  State<HotelListPage> createState() => _HotelListPageState();
}

class _HotelListPageState extends State<HotelListPage>
    with TickerProviderStateMixin {
  late TabController _tabController;
  late int _currentIndex;
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  CityModel _city = CityList.cities[0];
  List<Hotel> _hotelList = [];

  late String _ctgId;

  @override
  void initState() {
    _currentIndex = CityList.cities.indexOf((widget.changedCity));
    super.initState();
    _tabController = TabController(length: CityList.cities.length, vsync: this, initialIndex: _currentIndex);
    _ctgId = widget.ctgId;
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
            future: HotelService().fetchHotelsByCity(_city.value),
            builder: (context, AsyncSnapshot<List<Hotel>> snap) {
              if (snap.hasError) {
                return const Text('Error');
              } else if (snap.hasData) {
                _hotelList = [];

                if (widget.ctgId == 'all') {
                  _hotelList = snap.data as List<Hotel>;
                } else {
                  // ignore: curly_braces_in_flow_control_structures
                  for (var element in snap.data!) {
                    if (element.categoryId == _ctgId) {
                      _hotelList.add(element);
                    }
                  }
                }

                if (_hotelList.isEmpty) {
                  return const EmptyPageWidget();
                }

                return GridView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    padding: MyEdgeInsets.symmetric(h: 15.0, v: 20.0),
                    gridDelegate: _gridDelegate(),
                    itemCount: _hotelList.length,
                    itemBuilder: (ctx, i) {
                      Hotel hotel = _hotelList[i];
                      String img = hotel.media[0];
                      img = imageFilter(img);
                      return _buildHotelLayout(img, hotel);
                    });
              }
              return SizedBox(
                height: 812.h - 200.h,
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

  InkWell _buildHotelLayout(String img, Hotel hotel) {
    return InkWell(
      onTap: () {
        CustomNavigator.push(ResHotelDetailsPage(hotel: hotel));
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
