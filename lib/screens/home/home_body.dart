import 'package:flutter/material.dart';
import 'package:mobileapp/core/components/exporting_packages.dart';
import 'package:mobileapp/cubit/home_cubit/home_cubit.dart';
import 'package:mobileapp/screens/home/widgets/container.dart';
import 'package:mobileapp/screens/home/widgets/popolar_object.dart';
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
                debugPrint("bosildi   !!!!");
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

          SizedBox(
            height: getHeight(154.0),
            width: MediaQuery.of(context).size.width,
            child: ListView.builder(
              itemCount: 6,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return Padding(
                  padding: MyEdgeInsets.all(8.0),
                  child: InkWell(
                    onTap: () {},
                    child: Container(
                        alignment: Alignment.bottomLeft,
                        height: getHeight(150.0),
                        width: getWidth(111.0),
                        decoration: MyDecoration.netImage(
                            netImage:
                                "https://source.unsplash.com/random/$index"),
                        child: Padding(
                          padding: MyEdgeInsets.only(left: 10, bottom: 5.0),
                          child: Text(
                            "Hilton",
                            style: TextStyle(
                                fontSize: getWidth(10.0), color: Colors.white),
                          ),
                        )),
                  ),
                );
              },
            ),
          ),

          RowTextWidgets(ontap: () {}, text: "Ресторан", bottomText: "Все"),
          SizedBox(
            height: getHeight(210.0),
            child: ListView.builder(
              itemCount: 10,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    height: getHeight(200.0),
                    width: getWidth(150.0),
                    decoration: MyDecoration.circular(
                        color: Colors.grey.shade200, radius: 5),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(right: 15.0,left: 15.0,top: 15),
                          child: Container(
                            height: getHeight(110.0),
                            width: getWidth(130.0),
                            decoration: MyDecoration.netImage(
                                netImage:
                                    "https://source.unsplash.com/random/$index"),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 4.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: const [
                              Text("_______"),
                              Padding(
                                padding: EdgeInsets.only(right: 5,left: 5,),
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
                        const Padding(
                                padding: EdgeInsets.only(left: 15),
                                child: Text("Национальные продукты",style: TextStyle(fontSize: 15.0),),
                              ),
                      ],
                    ),
                  ),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
