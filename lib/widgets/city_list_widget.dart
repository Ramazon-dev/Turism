import 'package:flutter/material.dart';
import 'package:mobileapp/core/components/exporting_packages.dart';

class CityListWidget extends StatelessWidget {

  final String cityName;
  final ValueChanged<CityModel> onCityChanged;
  const CityListWidget({
    Key? key,
    required this.onCityChanged,
    required this.cityName,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MySizedBox(
      height: 59.0,
      child: ListView.builder(
          padding: MyEdgeInsets.symmetric(h: 15.0),
          itemCount: CityList.cities.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (ctx, i) {
            CityModel city = CityList.cities[i];
            return Chip(
              backgroundColor: cityName == city.name
                  ? AppColors.greyPrice
                  : Colors.transparent,
              padding: MyEdgeInsets.symmetric(h: 20.0, v: 10.0),
              label: Text(
                city.name,
                style: AppTextStyle.medium(
                  size: 16.0,
                  color: cityName == city.name
                      ? AppColors.white
                      : AppColors.greyPrice,
                ),
              ).onClick(() {
                onCityChanged.call(city);
              }),
            );
          }),
    );
  }
}
