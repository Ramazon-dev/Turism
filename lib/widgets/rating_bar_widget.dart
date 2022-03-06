import 'package:flutter/material.dart';
import 'package:mobileapp/core/components/exporting_packages.dart';

class RatingBarWidget extends StatelessWidget {
  final double rating;
  const RatingBarWidget({Key? key, required this.rating}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RatingBar.builder(
        itemCount: 5,
        ignoreGestures: true,
        initialRating: rating,
        allowHalfRating: true,
        itemBuilder: (ctx, i) => SvgPicture.asset(AppIcons.star),
        onRatingUpdate: (v) {});
  }
}
