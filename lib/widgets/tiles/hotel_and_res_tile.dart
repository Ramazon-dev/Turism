import 'package:flutter/material.dart';
import 'package:mobileapp/core/components/exporting_packages.dart';
import 'package:mobileapp/widgets/buttons/link_with_icon_button.dart';
import 'package:mobileapp/widgets/rating_bar_widget.dart';
import 'base_business_tile.dart';

class BusinessHotelResTile extends StatelessWidget {
  final dynamic data;

  const BusinessHotelResTile({Key? key, required this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseBusinessTile(
      // TODO: Bu yerga Hotel rasmi qo'yiladi
      imgUrl: MockData.place.media[0],
      title: data.name!,
      infoWidget: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          RatingBarWidget(rating: data.reyting!.toDouble()),
          SizedBox(height: 8.h),
          LinkWithIconButton(
            icon: AppIcons.location,
            label: LocaleKeys.mapLink.tr(),
            link: data.karta!,
          ),
          SizedBox(height: 8.h),
          data.site != null
              ? LinkWithIconButton(
                  icon: AppIcons.link,
                  label: data.site.toString(),
                  link: data.site.toString(),
                )
              : const SizedBox(),
        ],
      ),
    );
  }
}
