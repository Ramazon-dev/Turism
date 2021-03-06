import 'package:flutter/material.dart';
import 'package:mobileapp/core/components/exporting_packages.dart';
import 'package:mobileapp/core/components/image_filter.dart';
import 'package:mobileapp/screens/details/hotel_details_page_for_owner.dart';
import 'package:mobileapp/widgets/buttons/link_with_icon_button.dart';
import 'package:mobileapp/widgets/rating_bar_widget.dart';
import 'base_business_tile.dart';

class BusinessHotelTile extends StatelessWidget {
  final Hotel hotel;

  const BusinessHotelTile({Key? key, required this.hotel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseBusinessTile(
      imgUrl: imageFilter(hotel.media[0]),
      title: hotel.name,
      infoWidget: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          RatingBarWidget(
            rating: hotel.reyting!.toDouble(),
            users: hotel.users!,

          ),
          SizedBox(height: 8.h),
          LinkWithIconButton(
            icon: AppIcons.location,
            label: LocaleKeys.on_map.tr(),
            link: hotel.karta,
          ),
          SizedBox(height: 8.h),
          hotel.site != null
              ? LinkWithIconButton(
                  icon: AppIcons.link,
                  label: hotel.site.toString(),
                  link: hotel.site.toString(),
                )
              : const SizedBox(),
        ],
      ),
    ).onClick(
      () => CustomNavigator.push(ResHotelDetailsPageForOwner(hotel: hotel)
     
      ),
    );

  }
}
