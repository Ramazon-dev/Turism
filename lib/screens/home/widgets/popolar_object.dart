import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mobileapp/services/obekt_services.dart';

import '../../../core/components/exporting_packages.dart';

// ignore: must_be_immutable
class ContainerForPopularObject extends StatelessWidget {
  int itemCount;
  String objectName;
  String image;
  String date;

  ContainerForPopularObject({
    required this.itemCount,
    required this.date,
    required this.objectName,
    required this.image,
    Key? key,
  }) : super(key: key);
  final List<String> _categoryImages = [
    "https://codergp.files.wordpress.com/2015/05/images-4.jpg",
    "https://uzbekistan.travel/storage/app/media/nargiza/cropped-images/beldersay1-0-0-0-0-1590649308.jpg",
    "https://www.game-keeper.com/images/news/0701/1.jpeg",
    "https://ichef.bbci.co.uk/news/640/amz/worldservice/live/assets/images/2015/08/07/150807140426_tajikistan_lakes2_976x549_b.babayev.jpg",
    "https://codergp.files.wordpress.com/2015/05/images-4.jpg",
    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTtlgG0aLFuhIRThXhgddwhU2Z0dOGlyVxBxmTeEmTlsQP6Qlu6gXpUAzqR7XYxFHd5Hjo&usqp=CAU",
    "https://www.gazeta.uz/media/img/2021/11/YyBh0E16360144574678_b.jpg"
  ];

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: ObjectSevices().getCategories(),
        builder: (context, AsyncSnapshot<List<Category>?> snap) {
          if (snap.hasData) {
            List<Category> data = snap.data!;
            return SizedBox(
              height: getHeight(182.0),
              child: ListView.builder(
                  itemCount: data.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return Padding(
                        padding: MyEdgeInsets.all(10.0),
                        child: SizedBox(
                          child: Column(
                            children: [
                              InkWell(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => PlacePage(
                                                category: data[index].id,
                                                city: CityList.cities.first,
                                              )));
                                },
                                child: Container(
                                  height: getHeight(115.0),
                                  width: getWidth(205.0),
                                  decoration: MyDecoration.netImage(
                                      netImage: _categoryImages[index]),
                                  alignment: Alignment.topRight,
                                ),
                              ),
                              SizedBox(
                                height: getHeight(47.0),
                                child: Column(
                                  children: [
                                    Padding(
                                      padding: MyEdgeInsets.only(
                                          right: 50.0.w, top: 5.0),
                                      child: Text(
                                        data[index].showInfo(context.locale.languageCode),
                                        style: TextStyle(
                                            fontWeight: FontWeight.w400,
                                            fontSize: getWidth(12.0)),
                                      ),
                                    ),

                                  ],
                                ),
                              )
                            ],
                          ),
                        ));
                  }),
            );
          } else {
            return SizedBox(
                height: 128.h,
                child: const Center(child: CupertinoActivityIndicator()));
          }
        });
  }
}
