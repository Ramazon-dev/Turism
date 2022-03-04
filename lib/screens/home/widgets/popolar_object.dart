import 'package:flutter/material.dart';
import 'package:mobileapp/widgets/star_bar.dart';

import '../../../core/components/exporting_packages.dart';

class ContainerForPopularObject extends StatelessWidget {
  VoidCallback ontap;
  int itemCount;
  String objectName;
  String image;
  String date;
  ContainerForPopularObject({
    required this.ontap,
    required this.itemCount,
    required this.date,
    required this.objectName,
    required this.image,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: getHeight(175.0),
      child: ListView.builder(
          itemCount: itemCount,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return Padding(
                padding: MyEdgeInsets.all(10.0),
                child: SizedBox(
                  child: Column(
                    children: [
                      InkWell(
                        onTap: ontap,
                        child: Container(
                          height: getHeight(115.0),
                          width: getWidth(205.0),
                          decoration: MyDecoration.netImage(netImage: image),
                          alignment: Alignment.topRight,
                          child: StartBar(son: 5.0),
                        ),
                      ),
                      SizedBox(
                        height: getHeight(40.0),
                        child: Column(
                          children: [
                            Padding(
                              padding: MyEdgeInsets.only(right: 50.0, top: 5.0),
                              child: Text(
                                "На велосипеде по городу",
                                style: TextStyle(
                                    fontWeight: FontWeight.w400,
                                    fontSize: getWidth(12.0)),
                              ),
                            ),
                            Padding(
                              padding: MyEdgeInsets.only(right: 90, top: 5),
                              child: Row(
                                children: [
                                  SvgPicture.asset(AppIcons.location,
                                      color: AppColors.grey),
                                  SizedBox(
                                    width: getWidth(5.0),
                                  ),
                                  Text(
                                    date,
                                    style: TextStyle(fontSize: getWidth(12.0)),
                                  )
                                ],
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
  }
}