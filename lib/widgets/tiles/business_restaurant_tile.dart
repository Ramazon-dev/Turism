import 'package:flutter/material.dart';
import 'package:mobileapp/core/components/exporting_packages.dart';
import 'package:mobileapp/screens/business_profile/restaurant/restaurant_page.dart';
import 'package:mobileapp/widgets/buttons/link_with_icon_button.dart';
import '../rating_bar_widget.dart';
import 'base_business_tile.dart';

class BusinessRestaurantTile extends StatelessWidget {
  final Restaurant restaurant;

  const BusinessRestaurantTile({Key? key, required this.restaurant})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseBusinessTile(
      // TODO: Bu yerga Hotel rasmi qo'yiladi
      imgUrl: MockData.place.media[0],
      title: restaurant.name!,
      infoWidget: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            restaurant.date!,
            maxLines: 1,
            style: AppTextStyle.regular(size: 12.0, color: AppColors.grey),
          ),
          SizedBox(height: 10.h),
          RatingBarWidget(
            rating: restaurant.reyting!.toDouble(),
            users: restaurant.users!,
          ),
          SizedBox(height: 8.h),
          LinkWithIconButton(
            icon: AppIcons.location,
            label: LocaleKeys.tourist_zone.tr(),
            link: restaurant.karta!,
          ),
          // SizedBox(height: 8.h),
          // restaurant.site != null
          //     ? LinkWithIconButton(
          //         icon: AppIcons.link,
          //         label: restaurant.site.toString(),
          //         link: restaurant.site.toString(),
          //       )
          //     : const SizedBox(),
        ],
      ),
    ).onClick(() => CustomNavigator.push(RestaurantPage(
          restaurant: Restaurant.fromJson(restaurant.toJson()),
          isEditing: true,
        )));
  }
}
