import 'package:flutter/material.dart';
import 'package:mobileapp/core/components/exporting_packages.dart';
import 'package:mobileapp/cubit/home_cubit/home_cubit.dart';
import 'package:mobileapp/widgets/category_list.dart';

import 'package:mobileapp/widgets/divider_widgets.dart';
import 'package:mobileapp/widgets/text_widgets.dart';

class HomeBody extends StatelessWidget {
  final HomeCubit cubit;

  const HomeBody({Key? key, required this.cubit}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return SingleChildScrollView(
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        CategoryList(list: MockData.categoryList, cubit: cubit),
        _buildTextWidgetTwo(),
        _showNearby(),
        const dividerWidget(),
        _showTur(context),
      ]),
    );
  }

  GridView _showTur(BuildContext context) {
    return GridView.builder(
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemCount: 9,
        padding: MyEdgeInsets.symmetric(h: 16.0, v: 25.0),
        gridDelegate: (SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 0.77,
          crossAxisSpacing: getWidth(8.0),
          mainAxisSpacing: getHeight(20.0),
        )),
        itemBuilder: (context, index) {
          return Container(
            decoration: MyDecoration.shadow(color: Colors.black12),
            height: getHeight(273.0),
            width: getWidth(165.0),
            child: Column(children: [
              Container(
                height: getHeight(200.0),
                width: getWidth(165.0),
                decoration: MyDecoration.netImage(
                    netImage: "https://source.unsplash.com/random/index1",
                    radius: 5.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: SvgPicture.asset(
                        AppIcons.favourite,
                      ),
                    ),
                  ],
                ),
              ),
            ]),
          );
        });
  }

  TextWidgetTwo _buildTextWidgetTwo() {
    return TextWidgetTwo(
      "Ближайшие туры.",
      style: TextWidgetTwo.medium(size: 18.0),
    );
  }

  SizedBox _showNearby() {
    return SizedBox(
      height: 200.0,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 5,
        itemBuilder: (context, index) {
          return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                height: getHeight(200.0),
                width: 330.0,
                decoration: MyDecoration.netImage(
                    netImage: "https://source.unsplash.com/random/1",
                    radius: 5.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Container(
                      height: getHeight(22.0),
                      width: getWidth(51.0),
                      color: Colors.yellow,
                    ),
                  ],
                ),
              ));
        },
      ),
    );
  }

  Container _buildTop() {
    return Container(
      alignment: Alignment.center,
      height: getHeight(56.0),
      color: Colors.blue,
      child: ListView.builder(
        itemCount: 10,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              width: getWidth(65.0),
              height: getHeight(39.0),
              color: Colors.greenAccent,
            ),
          );
        },
      ),
    );
  }
}
