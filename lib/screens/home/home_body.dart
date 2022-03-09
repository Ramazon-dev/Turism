import 'package:flutter/material.dart';
import 'package:mobileapp/core/components/exporting_packages.dart';
import 'package:mobileapp/core/data/city_list.dart';
import 'package:mobileapp/cubit/home_cubit/home_cubit.dart';
import 'package:mobileapp/screens/home/widgets/container.dart';
import 'package:mobileapp/screens/home/widgets/hotel_view.dart';
import 'package:mobileapp/screens/home/widgets/popolar_object.dart';
import 'package:mobileapp/widgets/city_list_widget.dart';
import 'package:mobileapp/widgets/row_text.dart';

class HomeBody extends StatelessWidget {
  final HomeCubit cubit;

  const HomeBody({Key? key, required this.cubit}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return SingleChildScrollView(
      // physics: const BouncingScrollPhysics(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: MyEdgeInsets.only(left: 10),
            child: Text(
              "Ближайшие туры.",
              style: TextStyle(
                  fontSize: getWidth(18.0), fontWeight: FontWeight.w400),
            ),
          ),
          ShowNerarby(
            ontap: () {},
            itemCount: 6,
            image: "https://source.unsplash.com/random/1",
            text: "Вас ждет путешествие по реке Амирсой!",
            starNumber: 5.0,
          ),
          RowTextWidgets(
              ontap: () {
                print("bosildi");
              },
              text: "Популярные пакеты.",
              bottomText: "Все"),
          ContainerForPopularObject(
            ontap: () {},
            itemCount: 4,
            image: "https://source.unsplash.com/random/1",
            objectName: "На велосипеде по городу",
            date: "10 минут. 5 сек",
          ),
          RowTextWidgets(ontap: () {}, text: "Регионы.", bottomText: "Все"),
          const PopularObject(),
          RowTextWidgets(
              ontap: () {}, text: "Где мы находимся :)", bottomText: "Все"),
          HotelsView(
            ontap: () {},
            itemCount: 3,
            image: "https://source.unsplash.com/random/1",
            starCount: 40,
            hotelName: "Hotel Uzbekistan",
          ),
          RowTextWidgets(ontap: () {}, text: "Ресторан", bottomText: "Все"),
          SizedBox(
            height: getHeight(150.0),
            child: ListView.builder(
                itemCount: 10,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      height: getHeight(150.0),
                      width: getWidth(300.0),
                      decoration: MyDecoration.circular(radius: 5),
                      child: Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(15.0),
                            child: Container(
                              height: getHeight(120.0),
                              width: getWidth(138.49),
                              decoration: MyDecoration.netImage(
                                  netImage:
                                      "https://source.unsplash.com/random/1"),
                            ),
                          ),
                          Column(
                            children: [],
                          )
                        ],
                      ),
                    ),
                  );
                }),
          )
        ],
      ),
    );
  }
}
