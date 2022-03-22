import 'package:flutter/material.dart';
import 'package:mobileapp/core/components/exporting_packages.dart';
import 'package:mobileapp/screens/business_profile/hotel/input_hotel_page.dart';
import 'package:mobileapp/screens/profile/auth_profile_page.dart';
import 'package:mobileapp/widgets/dialogs/comment_dialog.dart';
import 'package:mobileapp/widgets/images_page_view.dart';
import 'package:mobileapp/widgets/phone_list_widget.dart';
import 'package:mobileapp/widgets/rating_bar_widget.dart';

class ResHotelDetailsPageForOwner extends StatelessWidget {
  final Hotel hotel;

  const ResHotelDetailsPageForOwner({Key? key, required this.hotel})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      resizeToAvoidBottomInset: false,
      floatingActionButton: _buildFloatingActionButton(context),
      appBar: SimpleAppBar(title: hotel.name),
      body: Column(
        children: [
          Center(
            child: Container(
              margin: EdgeInsets.only(top: getHeight(20)),
              padding: MyEdgeInsets.only(bottom: 24.0),
              width: getWidth(345),
              decoration: BoxDecoration(
                border: Border.all(
                  color: AppColors.darkBorder,
                  width: getWidth(1),
                ),
                borderRadius: BorderRadius.all(
                  Radius.circular(
                    getWidth(7),
                  ),
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin: EdgeInsets.all(getWidth(11)),
                    width: getWidth(323),
                    height: getHeight(255),
                    child: ImagesPageView(imageList: hotel.media),
                  ),
                  Padding(
                    padding: MyEdgeInsets.symmetric(h: 20.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        MySizedBox(
                          width: 178.0,
                          child: Text(
                            hotel.name,
                            overflow: TextOverflow.ellipsis,
                            maxLines: 1,
                            style: AppTextStyle.medium(),
                          ),
                        ),
                        MySizedBox(height: 10.0),
                        RatingBarWidget(
                          rating: hotel.reyting!.toDouble(),
                          users: hotel.users!,
                        ),
                        MySizedBox(height: 10.0),
                        Row(
                          children: [
                            SvgPicture.asset(AppIcons.location),
                            SizedBox(
                              width: getWidth(4),
                            ),
                            UrlTextWidget(
                              url: hotel.karta,
                              text: LocaleKeys.on_map.tr(),
                            )
                          ],
                        ),
                        SizedBox(
                          height: getHeight(4),
                        ),
                        if (hotel.site != null)
                          Row(
                            children: [
                              SvgPicture.asset(AppIcons.link),
                              SizedBox(
                                width: getWidth(4),
                              ),
                              UrlTextWidget(
                                url: hotel.site,
                                text: hotel.site,
                              )
                            ],
                          ),
                        SizedBox(
                          height: getHeight(28),
                        ),
                        Text(
                          hotel.informEn.tr(),
                          style: AppTextStyle.regular(),
                        ),
                        SizedBox(height: 21.h),
                        PhoneListWidget(phoneList: hotel.tell!),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            IconButton(
                              onPressed: () => CustomNavigator.push(
                                InputHotelPage(
                                  isEditing: true,
                                  hotel: Hotel.fromJson(hotel.toJson()),
                                ),
                              ),
                              icon: const Icon(
                                Icons.edit,
                              ),
                              color: Colors.green,
                            ),
                            IconButton(
                              onPressed: () {
                                showDialog(
                                  context: context,
                                  builder: (context) => AlertDialog(
                                    title: const Text(
                                        "Chindan o'chirishni istaysizmi"),
                                    actions: [
                                      TextButton(
                                        child: const Text("Yo'q"),
                                        onPressed: () {
                                          Navigator.of(context).pop();
                                        },
                                      ),
                                      TextButton(
                                        child: const Text('Ha'),
                                        onPressed: () {
                                          HotelService()
                                              .deleteHotel(hotelId: hotel.id)
                                              .then((value) =>
                                                  Navigator.pushAndRemoveUntil(
                                                      context,
                                                      MaterialPageRoute(
                                                          builder: (_) =>
                                                              const HomeScreen()),
                                                      (route) => false));
                                        },
                                      ),
                                    ],
                                  ),
                                );
                              },
                              icon: const Icon(
                                Icons.delete,
                                color: Colors.red,
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  FloatingActionButton _buildFloatingActionButton(BuildContext context) {
    return FloatingActionButton(
      backgroundColor: AppColors.black,
      child: SvgPicture.asset(AppIcons.comment),
      onPressed: () => _onButtonPressed(context),
    );
  }

  void _onButtonPressed(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (ctx) => CommentListDialog(headers: {'hotel_id': hotel.id}),
    );
  }
}
