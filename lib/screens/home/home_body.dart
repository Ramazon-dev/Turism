import 'package:flutter/material.dart';
import 'package:mobileapp/core/components/exporting_packages.dart';
import 'package:mobileapp/cubit/home_cubit/home_cubit.dart';
import 'package:mobileapp/widgets/category_list.dart';

import 'package:mobileapp/widgets/divider_widgets.dart';
import 'package:mobileapp/widgets/row_text.dart';
import 'package:mobileapp/widgets/star_bar.dart';
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
        RowTextWidgets(
            ontab: () {
              print("bosildi");
            },
            text: "Популярные пакеты.",
            bottomText: "Все"),
        Container(
          height: getHeight(155.0),
          child: ListView.builder(
              itemCount: 10,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return Padding(
                  padding: MyEdgeInsets.all(10.0),
                  child: Column(children: [Container(
                    height: getHeight(115.0),
                    width: getWidth(205.0),
                    decoration: MyDecoration.netImage(netImage: "https://source.unsplash.com/random/1"),
                    alignment: Alignment.topRight,
                    child: StartBar(son: 5.0),
                  ),Container(height: getHeight(50.0),color: Colors.blue,)],)
                  
                );
              }),
        )
      ]),
    );
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
                    StartBar(
                      son: 5.0,
                    ),
                    Padding(
                      padding: MyEdgeInsets.only(top: 90, left: 20),
                      child: Text(
                        "Вас ждет путешествие по реке Амирсой!",
                        style: TextStyle(
                            fontSize: getWidth(20.0), color: AppColors.white),
                      ),
                    )
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
