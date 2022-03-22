import 'package:flutter/material.dart';
import 'package:mobileapp/core/components/exporting_packages.dart';
import 'package:mobileapp/widgets/dialogs/comment_dialog.dart';
import 'package:mobileapp/widgets/images_page_view.dart';
import 'package:mobileapp/widgets/phone_list_widget.dart';
import 'package:mobileapp/widgets/rating_bar_widget.dart';

class ResHotelDetailsPage extends StatelessWidget {
  final Hotel hotel;

  const ResHotelDetailsPage({Key? key, required this.hotel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    print(GetStorage().read('user')['id']);
    //print(hotel.owner);
    return Scaffold(
      resizeToAvoidBottomInset: false,
      floatingActionButton: FloatingActionButton(
        backgroundColor: AppColors.black,
        child: SvgPicture.asset(AppIcons.comment),
        onPressed: () {
          _onButtonPressed(context);
        },
      ),
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
                            users: hotel.users!),
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
                        SizedBox(height: getHeight(4)),
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
                        SizedBox(height: getHeight(28)),
                        Text(
                          hotel.informEn,
                          style: AppTextStyle.regular(),
                        ),
                        SizedBox(height: 21.h),
                        PhoneListWidget(phoneList: hotel.tell!),
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
      builder: (ctx) => CommentListDialog(headers: {'hotel_id': hotel.id}),
    );
  }
}
