import 'package:flutter/material.dart';
import 'package:mobileapp/core/components/exporting_packages.dart';
import 'package:mobileapp/widgets/rating_bar_widget.dart';

// ignore: must_be_immutable
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
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              name,
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
              style: TextStyle(
                fontSize: getWidth(16),
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
        SizedBox(height: getHeight(8)),
        RichText(
            text: TextSpan(children: [
          TextSpan(
            text: '$price\$',
            style: TextStyle(
              color: AppColors.greyPrice,
              fontSize: getWidth(16),
              fontWeight: FontWeight.w500,
            ),
          ),
          TextSpan(
            text: '/1 kunga',
            style: TextStyle(
              color: AppColors.black,
              fontSize: getWidth(8),
              fontWeight: FontWeight.w400,
            ),
          )
        ])),
        SizedBox(height: getHeight(10)),
        RatingBarWidget(rating: rating, users: users)
      ],
    );
  }
}
