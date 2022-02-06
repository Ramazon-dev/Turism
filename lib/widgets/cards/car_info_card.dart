import 'package:flutter/material.dart';
import 'package:mobileapp/core/components/exporting_packages.dart';
import 'package:mobileapp/core/components/my_border_radius.dart';

class CarInfoCard extends StatelessWidget {
  const CarInfoCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: getHeight(137.0),
      width: getWidth(110.0),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: MyBorderRadius.circular(radius: 12.0)
        ),
        margin: EdgeInsets.zero,
        child: Column(
          children: [
            ClipRRect(
              borderRadius: MyBorderRadius.only(topLeft: 12.0, topRight: 12.0),
              child: Image.network(
                'https://source.unsplash.com/random/45',
                width: MediaQuery.of(context).size.width,
                height: getHeight(160.0),
                fit: BoxFit.cover,
              ),
            ),
            MySizedBox(height: 5.0),
            Text('Captive', style: TextWidget.medium(size: 18.0)),
            MySizedBox(height: 7.0),
            Container(
              alignment: Alignment.center,
              margin: MyEdgeInsets.symmetric(h: 12.0),
              decoration: MyDecoration.circular(),
              width: MediaQuery.of(context).size.width,
              padding: MyEdgeInsets.symmetric(v: 5.0, h: 40.0),
              child: Text(
                '150\$',
                style: TextWidget.medium(size: 8.0, color: AppColors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}