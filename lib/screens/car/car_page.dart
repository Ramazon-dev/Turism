import 'package:flutter/material.dart';
import 'package:mobileapp/core/components/exporting_packages.dart';
import 'package:mobileapp/cubit/car_cubit/car_cubit.dart';
import 'package:mobileapp/services/car_service.dart';
import 'package:mobileapp/widgets/cards/car_info_card.dart';
import 'package:mobileapp/widgets/navigators/drawer_widget.dart';
import 'package:mobileapp/widgets/top_bar/app_bar_with_list.dart';

import '../../models/category_model.dart';
import '../../services/locale_service.dart';

class CarPage extends StatefulWidget {
  const CarPage({Key? key}) : super(key: key);

  @override
  State<CarPage> createState() => _CarPageState();
}

class _CarPageState extends State<CarPage> with TickerProviderStateMixin {
  late TabController _tabController;
  late TabController _ctgTabController;
  late Category _currentCtg;
  late final List<Category> _categories = (GetStorage().read('restCategories') as List)
      .map((e) => Category.fromJson(e))
      .toList();

  int _currentIndex = 0;
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: CityList.cities.length, vsync: this);
    _ctgTabController = TabController(length: _categories.length, vsync: this);
    _currentCtg = _categories[0];
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return BlocProvider(
      create: (_) => CarCubit(),
      child: BlocBuilder<CarCubit, CarState>(
        builder: (context, state) {
          // CarCubit cubit = context.watch();
          return Scaffold(
            key: _scaffoldKey,
            drawer: const DrawerWidget(),
            appBar: AppBarWithList(
              title: LocaleKeys.transport.tr(),
              onTabChanged: _onTabChanged,
              tabController: _tabController,
              elevation: 0.0,
              onPressed: () {
                _scaffoldKey.currentState!.openDrawer();
            
              },
            ),
            body: Column(
              children: [
                _ctgTab(),
                FutureBuilder(
                  future: TransportService.getDataFromApi(
                      CityList.cities[_currentIndex].value),
                  builder: (context, AsyncSnapshot<List<TransportModel>?> snap) {
                    if (snap.hasError) {
                      return const Center(
                        child: Text("Internet conntection has error"),
                      );
                    } else if (snap.hasData) {
                      var data = snap.data;

                      if (data!.isEmpty) {
                        return const EmptyPageWidget();
                      }

                      return Expanded(
                        child: GridView.builder(
                          padding: MyEdgeInsets.symmetric(h: 16.0, v: 25.0),
                          itemCount: data.length,
                          itemBuilder: (ctx, i) {
                            TransportModel transportModel = data[i];
                            return CarInfoCard(
                              transport: transportModel,
                            );
                          },
                          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            mainAxisExtent: 230.h,
                            crossAxisSpacing: getWidth(8.0),
                            mainAxisSpacing: getHeight(20.0),
                          ),
                        ),
                      );
                    } else {
                      return const Center(child: CircularProgressIndicator());
                    }
                  },
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  Container _ctgTab() => Container(
    height: 64.h,
    color: AppColors.white,
    child: TabBar(
      controller: _ctgTabController,
      onTap: (v) {
        setState(() {
          _currentCtg = _categories[v];
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
      tabs: _categories
          .map((e) => Tab(
        text: e.showInfo(LocaleService.currentLocale),
      ))
          .toList(),
    ),
  );


  void _onTabChanged(i) {
    setState(() {
      _currentIndex = i;
    });
  }
}
