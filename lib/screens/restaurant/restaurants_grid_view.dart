import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mobileapp/core/components/exporting_packages.dart';
import 'package:mobileapp/core/components/image_filter.dart';
import 'package:mobileapp/models/category_model.dart';
import 'package:mobileapp/screens/details/restaurant_details_page.dart';
import 'package:mobileapp/services/locale_service.dart';
import 'package:mobileapp/services/restaurant_service.dart';
import 'package:mobileapp/widgets/top_bar/app_bar_with_list.dart';

class RestaurantsGridView extends StatefulWidget {
  String? ctgId;

  RestaurantsGridView({Key? key, this.ctgId}) : super(key: key);

  @override
  State<RestaurantsGridView> createState() => _RestaurantsGridViewState();
}

class _RestaurantsGridViewState extends State<RestaurantsGridView>
    with TickerProviderStateMixin {
  late TabController _tabController;
  late TabController _ctgTabControlller;
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  CityModel _city = CityList.cities[0];
  late List<Category> categories = (GetStorage().read('restCategories') as List)
      .map((e) => Category.fromJson(e))
      .toList();

  late List<Restaurant> _restList = [];
  late Category _currentCtg;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: CityList.cities.length, vsync: this);
    _ctgTabControlller = TabController(length: categories.length, vsync: this);
    _currentCtg = categories[0];
  }

  @override
  Widget build(BuildContext context) {
    print('_RestaurantsGridViewState.build: ${widget.ctgId}');
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBarWithList(
        onPressed: () => Navigator.pop(context),
        tabController: _tabController,
        title: LocaleKeys.restaurant.tr(),
        onTabChanged: _onTabChanged,
        icon: Icons.arrow_back_ios_outlined,
        elevation: 0.0,
      ),
      body: Column(
        children: [
          FutureBuilder(
              future: RestaurantService().fetchRestaurantsByCity(_city.value),
              builder: (context, AsyncSnapshot<List<Restaurant>?> snap) {
                if (snap.hasError) {
                  return const Text('Error');
                } else if (snap.hasData) {
                  _restList = [];
                    // ignore: curly_braces_in_flow_control_structures
                    for (var element in snap.data!) {
                      if (element.categoryId == '${widget.ctgId}') {
                        _restList.add(element);
                      }
                    }
                  if (_restList.isEmpty) {
                    return const EmptyPageWidget();
                  }

                  return Expanded(
                    child: GridView.builder(
                        padding: MyEdgeInsets.symmetric(h: 15.0, v: 20.0),
                        gridDelegate: _gridDelegate(),
                        itemCount: _restList.length,
                        itemBuilder: (ctx, i) {
                          Restaurant rest = _restList[i];
                          String img = imageFilter(rest.media![0]);
                          return _buildHotelLayout(img, rest);
                        }),
                  );
                }
                return const Center(child: CupertinoActivityIndicator());
              }),
        ],
      ),
    );
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
                  rest.tell![0].toString(),
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

  Container _ctgTab() => Container(
        height: 64.h,
        color: AppColors.white,
        child: TabBar(
          controller: _ctgTabControlller,
          onTap: (v) {
            setState(() {
              _currentCtg = categories[v];
            });
          },
          isScrollable: true,
          padding: MyEdgeInsets.symmetric(h: 20.0, v: 10.0),
          indicatorColor: AppColors.greyPrice,
          unselectedLabelColor: AppColors.greyPrice,
          indicator: MyDecoration.circular(
            color: AppColors.greyPrice,
            radius: 0.w,
          ),
          tabs: categories
              .map((e) => Tab(
                    text: e.showInfo(LocaleService.currentLocale),
                  ))
              .toList(),
        ),
      );

  SliverGridDelegateWithFixedCrossAxisCount _gridDelegate() {
    return SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: getHeight(20.0),
        crossAxisSpacing: getWidth(15.0),
        childAspectRatio: 0.7);
  }
}
