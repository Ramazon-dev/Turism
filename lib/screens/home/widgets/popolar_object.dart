import 'package:flutter/material.dart';
import 'package:mobileapp/models/obekt_model.dart';
import 'package:mobileapp/services/obekt_categoriya.dart';
import 'package:mobileapp/services/obekt_services.dart';
import 'package:mobileapp/widgets/star_bar.dart';

import '../../../core/components/exporting_packages.dart';

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
  List<String> kategoriya = [
    "https://codergp.files.wordpress.com/2015/05/images-4.jpg",
    "https://i1.wp.com/basetop.ru/wp-content/uploads/2018/01/fu4agirm.jpg",
    "https://yoshlikjurnali.uz/wp-content/uploads/zomin_haqida_uylar-640x400.jpg",
    "https://ichef.bbci.co.uk/news/640/amz/worldservice/live/assets/images/2015/08/07/150807140426_tajikistan_lakes2_976x549_b.babayev.jpg",
    "https://codergp.files.wordpress.com/2015/05/images-4.jpg",
    "https://i1.wp.com/basetop.ru/wp-content/uploads/2018/01/fu4agirm.jpg",
    "https://yoshlikjurnali.uz/wp-content/uploads/zomin_haqida_uylar-640x400.jpg",
    "https://ichef.bbci.co.uk/news/640/amz/worldservice/live/assets/images/2015/08/07/150807140426_tajikistan_lakes2_976x549_b.babayev.jpg"
  ];
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: ObektSevices().obektkategoriya(),
        builder: (context, AsyncSnapshot<List<ObektCategoriya>> snap) {
          if (snap.hasData) {
            List<ObektCategoriya> data = snap.data!;
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
                                                city: "",
                                              )));
                                },
                                child: Container(
                                  height: getHeight(115.0),
                                  width: getWidth(205.0),
                                  decoration: MyDecoration.netImage(
                                      netImage: kategoriya[index]),
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
                                        "${data[index].nameRu}",
                                        style: TextStyle(
                                            fontWeight: FontWeight.w400,
                                            fontSize: getWidth(12.0)),
                                      ),
                                    ),
                                    // Padding(
                                    //   padding:
                                    //       MyEdgeInsets.only(right: 90, top: 5),
                                    //   child: Row(
                                    //     children: [
                                    //       SvgPicture.asset(AppIcons.location,
                                    //           color: AppColors.grey),
                                    //       SizedBox(
                                    //         width: getWidth(5.0),
                                    //       ),
                                    //       Text(
                                    //         data[index].date.,
                                    //         style: TextStyle(
                                    //             fontSize: getWidth(12.0)),
                                    //       )
                                    //     ],
                                    //   ),
                                    // ),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ));
                  }),
            );
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        });
  }
}
