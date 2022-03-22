import 'package:flutter/material.dart';
import 'package:mobileapp/core/components/exporting_packages.dart';
import 'package:mobileapp/cubit/car_cubit/car_cubit.dart';
import 'package:mobileapp/models/transport_model.dart';
import 'package:mobileapp/services/car_service.dart';
import 'package:mobileapp/widgets/cards/car_info_card.dart';
import 'package:mobileapp/widgets/navigators/drawer_widget.dart';
import 'package:mobileapp/widgets/top_bar/app_bar_with_list.dart';

class CarPage extends StatefulWidget {
  const CarPage({Key? key}) : super(key: key);

  @override
  State<CarPage> createState() => _CarPageState();
}

class _CarPageState extends State<CarPage> with TickerProviderStateMixin {
  late TabController _tabController;
  int _currentIndex = 0;
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: CityList.cities.length, vsync: this);
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
              onPressed: () {
                _scaffoldKey.currentState!.openDrawer();
              },
            ),
            body: FutureBuilder(
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

                  return GridView.builder(
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
                  );
                } else {
                  return const Center(child:  CircularProgressIndicator());
                }
              },
            ),
          );
        },
      ),
    );
  }

  void _onTabChanged(i) {
    setState(() {
      _currentIndex = i;
    });
  }
}
