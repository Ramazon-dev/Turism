import 'package:flutter/material.dart';
import 'package:mobileapp/core/components/exporting_packages.dart';

// ignore: must_be_immutable
class RatingBarWidget extends StatelessWidget {
  final double rating;
  final int users;
  Color color;
  double itemSize;

  RatingBarWidget({
    Key? key,
    required this.rating,
    required this.users,
    this.itemSize = 14.0,
    this.color = AppColors.black,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        RatingBar.builder(
          itemCount: 5,
          itemSize: itemSize.w,
          ignoreGestures: true,
          initialRating: rating,
          allowHalfRating: true,
          onRatingUpdate: (v) {},
          itemBuilder: _itemRating,
        ),
        Text(' $rating', style: AppTextStyle.medium(size: 12.0, color: color)),
       if(rating != 0.0) Text( ' ($users)',
          style: AppTextStyle.medium(size: 12.0, color: color.withOpacity(0.8)),
        )
      ],
    );
  }

  Widget _itemRating(ctx, i) => SvgPicture.asset(
        AppIcons.star,
        color: AppColors.amber,
      );
}
