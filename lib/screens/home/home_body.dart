import 'package:flutter/material.dart';
import 'package:mobileapp/core/components/exporting_packages.dart';
import 'package:mobileapp/cubit/home_cubit/home_cubit.dart';
import 'package:mobileapp/screens/home/widgets/container.dart';
import 'package:mobileapp/screens/home/widgets/hotel_view.dart';
import 'package:mobileapp/screens/home/widgets/popolar_object.dart';
import 'package:mobileapp/widgets/rating_bar_widget.dart';
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
            padding: MyEdgeInsets.only(left: 10, top: 20),
            child: Text(
              "Ближайшие туры.",
              style: TextStyle(
                  fontSize: getWidth(18.0), fontWeight: FontWeight.w400),
            ),
          ),
          const ShowNerarby(),

          /// Популярные пакеты.
          RowTextWidgets(
              ontap: () {
                debugPrint("bosildi");
              },
              text: "Популярные пакеты.",
              bottomText: "Все"),
          ContainerForPopularObject(
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
            image: "https://source.unsplash.com/random/index",
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
                      decoration: MyDecoration.circular(
                          color: Colors.grey.shade200, radius: 5),
                      child: Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(15.0),
                            child: Container(
                              height: getHeight(120.0),
                              width: getWidth(138.49),
                              decoration: MyDecoration.netImage(
                                  netImage:
                                      "https://source.unsplash.com/random/$index"),
                            ),
                          ),
                          Container(
                            alignment: Alignment.topCenter,
                            height: 100,
                            width: 110,
                            child: Column(
                              children: [
                                Row(
                                  children: const [
                                    Text("_______"),
                                    Padding(
                                      padding:
                                          EdgeInsets.only(left: 5, right: 5),
                                      child: Text("___"),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(right: 5),
                                      child: Text("__"),
                                    ),
                                    Text("_"),
                                  ],
                                ),
                                const Padding(
                                  padding: EdgeInsets.only(top: 5, bottom: 5),
                                  child: Text("Национальные продукты"),
                                ),

                                const RatingBarWidget(rating: 4.5),

                          
                                const Padding(
                                  padding: EdgeInsets.only(left: 15, top: 10),
                                  child: Text(

                                    "улица Амира Темура 32А",
                                    style: TextStyle(
                                        fontSize: 8,
                                        color: AppColors.greyPrice),
                                  ),

                                        "улица Амира Темура 32А   ",
                                        style: TextStyle(
                                            fontSize: 8, color: AppColors.greyPrice),
                                      ),                              )
                              ],
                            ),
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
