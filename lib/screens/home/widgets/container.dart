import 'package:flutter/material.dart';
import 'package:mobileapp/core/components/exporting_packages.dart';
import 'package:mobileapp/core/data/city_list.dart';
import 'package:mobileapp/models/city_model.dart';
import 'package:mobileapp/screens/find_by_city/find_by_city_page.dart';
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
      height: 240.h,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: itemCount,
        padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 20.h),
        itemBuilder: (context, index) {
          return InkWell(
            onTap: ontap,
            child: Container(
              height: 200.h,
              width: 330.w,
              margin: EdgeInsets.symmetric(horizontal: 5.w),
              decoration: MyDecoration.netImage(netImage: image, radius: 5.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: MyEdgeInsets.only(left: 260, top: 10),
                    child: StartBar(
                      son: starNumber,
                    ),
                  ),
                  Padding(
                    padding: MyEdgeInsets.only(
                      top: 90,
                      left: 20,
                    ),
                    child: Text(
                      text,
                      style: TextStyle(
                          fontSize: getWidth(20.0), color: AppColors.white),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

class PopularObject extends StatelessWidget {
  const PopularObject({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200.h,
      child: ListView.builder(
        // padding: MyEdgeInsets.symmetric(h: 8.0),
        scrollDirection: Axis.horizontal,
        itemCount: CityList.cities.length,
        itemBuilder: (context, index) {
          CityModel city = CityList.cities[index];
          return Container(
            margin: MyEdgeInsets.all(8.0),
            padding: MyEdgeInsets.all(20.0),
            alignment: Alignment.bottomLeft,
            height: getHeight(200.0),
            width: 330.0,
            decoration: MyDecoration.netImage(netImage: city.imgUrl),
            child: Text(
              city.name,
              style: TextStyle(
                fontSize: getWidth(20.0),
                color: AppColors.white,
              ),
            ),
          ).onClick(() {
            CustomNavigator.push(SelectedCityPage(city: city));
          });
        },
      ),
    );
  }
}
