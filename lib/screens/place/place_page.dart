import 'package:flutter/material.dart';
import 'package:mobileapp/core/components/exporting_packages.dart';
import 'package:mobileapp/models/obekt_model.dart';
import 'package:mobileapp/services/obekt_services.dart';
import 'package:mobileapp/widgets/navigators/drawer_widget.dart';
import 'package:mobileapp/widgets/top_bar/app_bar_with_list.dart';

// ignore: must_be_immutable
class PlacePage extends StatefulWidget {
  final CityModel city;
  String? category;

  PlacePage({Key? key, required this.city, this.category}) : super(key: key);

  @override
  State<PlacePage> createState() => _PlacePageState();
}

class _PlacePageState extends State<PlacePage> with TickerProviderStateMixin {
  late TabController _tabController;
  late int _currentIndex;
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    _currentIndex = CityList.cities.indexOf((widget.city));
    super.initState();
    _tabController = TabController(
      length: CityList.cities.length,
      vsync: this,
      initialIndex: _currentIndex,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: _scaffoldKey,
        drawer: const DrawerWidget(),
        appBar: AppBarWithList(
          onTabChanged: _onTabChanged,
          tabController: _tabController,
          title: LocaleKeys.places.tr(),
          onPressed: () {
            _scaffoldKey.currentState!.openDrawer();
          },
        ),
        body: FutureBuilder(
            future: ObjectSevices()
                .fetchobektbyCity(CityList.cities[_currentIndex].value, widget.category ?? ''),
            builder: (context, AsyncSnapshot<List<Obekt>> snap) {
              if (snap.hasData) {
                List<Obekt> data = snap.data!;
                return SizedBox(
                    child: GridView.builder(
                        itemCount: data.length,
                        padding: MyEdgeInsets.symmetric(h: 15.0.h, v: 22.0.w),
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            mainAxisSpacing: getHeight(20.0),
                            crossAxisSpacing: getWidth(15.0),
                            mainAxisExtent: getHeight(284.0)),
                        itemBuilder: (ctx, i) {
                          return PlaceInfoCard(place: data[i]);
                        }));
              } else {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
            }));
  }

  void _onTabChanged(i) {
    setState(() {
      _currentIndex = i;
    });
  }
}
