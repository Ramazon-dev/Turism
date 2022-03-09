import 'package:flutter/material.dart';
import 'package:mobileapp/core/components/exporting_packages.dart';

class RatingBarWidget extends StatelessWidget {
  final double rating;

  const RatingBarWidget({Key? key, required this.rating}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        RatingBar.builder(
          itemCount: 5,
          itemSize: 14.w,
          ignoreGestures: true,
          initialRating: rating,
          allowHalfRating: true,
          onRatingUpdate: (v) {},
          itemBuilder: _itemRating,
        ),
        Text(' $rating', style: AppTextStyle.medium(size: 12.0)),
      ],
    );
  }

  Widget _itemRating(ctx, i) => SvgPicture.asset(
        AppIcons.star,
        color: AppColors.amber,
      );
}
