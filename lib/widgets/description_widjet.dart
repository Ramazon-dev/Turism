import 'package:flutter/material.dart';
import 'package:mobileapp/core/components/exporting_packages.dart';

class DescriptionWidget extends StatelessWidget {
  String name;
  String price;
  double rating;
  int users;
  DescriptionWidget(
      {Key? key,
      required this.name,
      required this.price,
      required this.rating,
      required this.users})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        SizedBox(
          width: MediaQuery.of(context).size.width - getWidth(80),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                name,
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
                style: TextStyle(
                  fontSize: getWidth(16),
                  fontWeight: FontWeight.w500,
                  fontFamily: 'Roboto',
                ),
              ),
              Text(
                name,
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
                style: TextStyle(
                  fontSize: getWidth(16),
                  fontWeight: FontWeight.w500,
                  color: AppColors.greyPrice,
                  fontFamily: 'Roboto',
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          height: getHeight(8),
        ),
        RichText(
            text: TextSpan(children: [
          TextSpan(
            text: '$price\$',
            style: TextStyle(
              color: AppColors.greyPrice,
              fontSize: getWidth(16),
              fontWeight: FontWeight.w500,
              fontFamily: 'Roboto',
            ),
          ),
          TextSpan(
            text: '/1 kunga',
            style: TextStyle(
              color: AppColors.black,
              fontSize: getWidth(8),
              fontWeight: FontWeight.w400,
              fontFamily: 'Roboto',
            ),
          )
        ])),
        SizedBox(
          height: getHeight(10),
        ),
        RatWidget(rating: rating, users: users)
      ],
    );
  }
}
