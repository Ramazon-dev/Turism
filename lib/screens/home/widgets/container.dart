import 'package:flutter/material.dart';
import 'package:mobileapp/core/components/exporting_packages.dart';
import 'package:mobileapp/widgets/star_bar.dart';

class ShowNerarby extends StatelessWidget {
  VoidCallback ontap;
  int itemCount;
  double starNumber;
  String text;
  String image;

  ShowNerarby({
    required this.ontap,
    required this.itemCount,
    required this.starNumber,
    required this.text,
    required this.image,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200.0,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: itemCount,
        itemBuilder: (context, index) {
          return Padding(
              padding: const EdgeInsets.all(8.0),
              child: InkWell(
                onTap: ontap,
                child: Container(
                  width: 330.0,
                  decoration:
                      MyDecoration.netImage(netImage: image, radius: 5.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: MyEdgeInsets.only(left: 260, top: 10),
                        child: StartBar(
                          son: starNumber,
                        ),
                      ),
                      Spacer(),
                      Padding(
                        padding: MyEdgeInsets.only(
                          left: 20,

                        ),
                        child: Text(
                          text,
                          maxLines: 2,

                          style: TextStyle(
                              fontSize: getWidth(20.0), color: AppColors.white),
                        ),
                      ),
                    ],
                  ),
                ),
              ));
        },
      ),
    );
  }
}

class PopularObject extends StatelessWidget {
  VoidCallback ontap;
  int itemCount;
  String text;
  String image;

  PopularObject({
    required this.itemCount,
    required this.ontap,
    required this.text,
    required this.image,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200.0,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: itemCount,
        itemBuilder: (context, index) {
          return Padding(
              padding: const EdgeInsets.all(8.0),
              child: InkWell(
                onTap: ontap,
                child: Container(
                  alignment: Alignment.bottomLeft,
                  height: getHeight(200.0),
                  width: 330.0,
                  decoration:
                      MyDecoration.netImage(netImage: image, radius: 5.0),
                  child: Padding(
                    padding: MyEdgeInsets.only(
                        top: 90, left: 20, bottom: getHeight(20.0)),
                    child: Text(
                      text,
                      style: TextStyle(
                          fontSize: getWidth(20.0), color: AppColors.white),
                    ),
                  ),
                ),
              ));
        },
      ),
    );
  }
}
