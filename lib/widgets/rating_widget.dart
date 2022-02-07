import 'package:flutter/material.dart';
import 'package:mobileapp/core/components/exporting_packages.dart';

class RatWidget extends StatelessWidget {
  double rating;
  int users;
  RatWidget({Key? key, required this.rating, required this.users})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Row(
      children: [
        RatingBar.builder(
          itemSize: getWidth(14),
          initialRating: 3,
          minRating: 1,
          direction: Axis.horizontal,
          allowHalfRating: true,
          itemCount: 5,
          itemPadding: EdgeInsets.symmetric(horizontal: getWidth(1)),
          itemBuilder: (context, _) {
            return SvgPicture.asset('assets/icons/fullStar.svg');
          },
          onRatingUpdate: (rating) {
            print(rating);
          },
        ),
        Text(
          rating == 0 ? '' : '$rating ($users)',
          style: TextStyle(
              fontSize: getWidth(12),
              fontFamily: 'Roboto',
              fontWeight: FontWeight.w500),
        ),
      ],
    ));
  }
}
