import 'package:flutter/material.dart';
import 'package:mobileapp/core/components/exporting_packages.dart';
import 'package:mobileapp/screens/business_profile/hotel/input_hotel_page.dart';
import 'package:mobileapp/screens/business_profile/restaurant/restaurant_page.dart';
import 'package:mobileapp/screens/profile/auth_profile_page.dart';
import 'package:mobileapp/services/restaurant_service.dart';
import 'package:mobileapp/widgets/dialogs/comment_dialog.dart';
import 'package:mobileapp/widgets/images_page_view.dart';
import 'package:mobileapp/widgets/phone_list_widget.dart';

class ResDetailsPageForOwner extends StatelessWidget {
  final Restaurant rest;

  const ResDetailsPageForOwner({Key? key, required this.rest})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      resizeToAvoidBottomInset: false,
      floatingActionButton: FloatingActionButton(
        backgroundColor: AppColors.black,
        child: SvgPicture.asset(AppIcons.comment),
        onPressed: () {
          _onButtonPressed(context);
        },
      ),
      appBar: SimpleAppBar(title: rest.name!),
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
                    child: ImagesPageView(imageList: rest.media!),
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
                            rest.name!,
                            overflow: TextOverflow.ellipsis,
                            maxLines: 1,
                            style: AppTextStyle.medium(),
                          ),
                        ),
                        MySizedBox(height: 10.0),
                        RatWidget(rating: 3, users: 0),
                        MySizedBox(height: 10.0),
                        Row(
                          children: [
                            SvgPicture.asset(AppIcons.location),
                            SizedBox(
                              width: getWidth(4),
                            ),
                            UrlTextWidget(
                              url: rest.karta,
                              text: 'Расположение на карте',
                            )
                          ],
                        ),
                        SizedBox(
                          height: getHeight(4),
                        ),
                        if (rest.site != null)
                          Row(
                            children: [
                              SvgPicture.asset(AppIcons.link),
                              SizedBox(
                                width: getWidth(4),
                              ),
                              UrlTextWidget(
                                url: rest.site,
                                text: rest.site,
                              )
                            ],
                          ),
                        SizedBox(
                          height: getHeight(28),
                        ),
                        Text(
                          "Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at ",
                          style: AppTextStyle.regular(),
                        ),
                        SizedBox(height: 21.h),
                        PhoneListWidget(phoneList: rest.tell!),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            IconButton(
                              onPressed: () => CustomNavigator.push(
                                RestaurantPage(
                                  isEditing: true,
                                  restaurant: rest,
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
                                          RestaurantService()
                                              .deleteRestaurant(rest.id!)
                                              .then((value) =>
                                                  Navigator.pushReplacement(
                                                    context,
                                                    MaterialPageRoute(
                                                        builder: (context) =>
                                                            const ProfileAuthPage()),
                                                  ));
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

  void _onButtonPressed(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (ctx) => CommentListDialog(headers: {'restaurant_id': rest.id!}),
    );
  }
}
