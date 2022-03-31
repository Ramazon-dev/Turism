import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mobileapp/core/components/exporting_packages.dart';
import 'package:mobileapp/cubit/home_cubit/home_cubit.dart';
import 'package:mobileapp/screens/home/widgets/container.dart';
import 'package:mobileapp/screens/home/widgets/popolar_object.dart';
import 'package:mobileapp/screens/restaurant/restaurants_grid_view.dart';
import 'package:mobileapp/widgets/navigators/drawer_widget.dart';
import 'package:mobileapp/widgets/row_text.dart';
import 'package:mobileapp/widgets/top_bar/home_app_bar.dart';

import '../../core/data/image_list.dart';

// ignore: must_be_immutable
class HomeBody extends StatelessWidget {
  final HomeCubit cubit;

  HomeBody({Key? key, required this.cubit}) : super(key: key);
  late List<Category> restaurantCategories;

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    restaurantCategories = (GetStorage().read('restCategories') as List)
        .map((e) => Category.fromJson(e))
        .toList();
    return Scaffold(
        drawer: const DrawerWidget(),
        key: _scaffoldKey,
        appBar: _buildHomeAppBar(context),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _showNearbyTours(),
              const ShowNearby(),

              /// Популярные пакеты.
              RowTextWidgets(
                ontap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => PlacePage(
                        category: 'all',
                      ),
                    ),
                  );
                },
                text: LocaleKeys.popular_packages.tr(),
                bottomText: LocaleKeys.all.tr(),
              ),
              ContainerForPopularObject(
                itemCount: 4,
                image: "https://source.unsplash.com/random/1",
                objectName: "На велосипеде по городу",
                date: "10 минут. 5 сек",
              ),
              RowTextWidgets(
                ontap: () {},
                text: LocaleKeys.regions.tr(),
                bottomText: LocaleKeys.all.tr(),
              ),
              const PopularObject(),
              RowTextWidgets(
                  ontap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const HotelListPage(ctgId: 'all'),
                      )),
                  text: LocaleKeys.where_will_we_stay.tr(),
                  bottomText: LocaleKeys.all.tr()),

              _showHotelList(context),

              RowTextWidgets(
                  ontap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => RestaurantsGridView(
                                ctgId: 'all',
                              ))),
                  text: LocaleKeys.restaurants.tr(),
                  bottomText: LocaleKeys.all.tr()),
              _showRestList()
            ],
          ),
        ));
  }

  Padding _showNearbyTours() {
    return Padding(
      padding: MyEdgeInsets.only(left: 10, top: 20),
      child: Text(
        LocaleKeys.nearby_tours.tr(),
        style: TextStyle(fontSize: getWidth(18.0), fontWeight: FontWeight.w400),
      ),
    );
  }

  HomeAppBar _buildHomeAppBar(BuildContext context) {
    return HomeAppBar(
      onDrawerPressed: () => _scaffoldKey.currentState!.openDrawer(),
      onLanguageChanged: (v) {
        v = v as Locale;
        cubit.onLanguageChanged(context, v.languageCode);
      },
    );
  }

  SizedBox _showHotelList(BuildContext context) {
    return SizedBox(
      height: getHeight(154.0),
      width: MediaQuery.of(context).size.width,
      child: FutureBuilder(
          future: HotelService().fetchCategoriesOfHotel(),
          builder: (context, AsyncSnapshot<List<Category>?> snap) {
            if (snap.hasData) {
              return ListView.builder(
                itemCount: ImageList.hotel.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  Category category = snap.data![index];
                  return Padding(
                    padding: MyEdgeInsets.all(8.0),
                    child: InkWell(
                      onTap: () {
                        CustomNavigator.push(HotelListPage(ctgId: category.id));
                      },
                      child: Container(
                          alignment: Alignment.bottomLeft,
                          height: getHeight(150.0),
                          width: getWidth(111.0),
                          decoration: MyDecoration.netImage(
                              netImage: ImageList.hotel[index]),
                          child: Padding(
                            padding: MyEdgeInsets.only(left: 10, bottom: 5.0),
                            child: Text(
                              snap.data![index]
                                  .showInfo(context.locale.languageCode),
                              style: TextStyle(
                                  fontSize: getWidth(15.0),
                                  color: Colors.white),
                            ),
                          )),
                    ),
                  );
                },
              );
            }

            return const Center(child: CupertinoActivityIndicator());
          }),
    );
  }

  SizedBox _showRestList() {
    return SizedBox(
      height: getHeight(210.0),
      child: ListView.builder(
        itemCount: ImageList.foodImages.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          String ctgId = restaurantCategories[index].id;
          return InkWell(
            onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => RestaurantsGridView(ctgId: ctgId))),
            child: Container(
              margin: const EdgeInsets.all(8.0),
              height: getHeight(200.0),
              width: getWidth(150.0),
              decoration:
                  MyDecoration.circular(color: Colors.grey.shade200, radius: 5),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                      padding: const EdgeInsets.only(
                          right: 15.0, left: 15.0, top: 15),
                      child: Container(
                        height: getHeight(110.0),
                        width: getWidth(130.0),
                        decoration: MyDecoration.netImage(
                            netImage: ImageList.foodImages[index]),
                      )),
                  Padding(
                    padding: const EdgeInsets.only(right: 4.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Text("_______"),
                        Padding(
                          padding: EdgeInsets.only(
                            right: 5,
                            left: 5,
                          ),
                          child: Text("___"),
                        ),
                        Padding(
                          padding: EdgeInsets.only(right: 5),
                          child: Text("__"),
                        ),
                        Text("_"),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 15),
                    child: Text(
                      restaurantCategories[index]
                              .showInfo(context.locale.languageCode) +
                          ' ' +
                          LocaleKeys.foods.tr(),
                      style: TextStyle(fontSize: 15.w),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
