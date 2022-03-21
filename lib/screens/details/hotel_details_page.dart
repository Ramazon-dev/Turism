import 'package:flutter/material.dart';
import 'package:mobileapp/core/components/exporting_packages.dart';
import 'package:mobileapp/core/data/image_list.dart';
import 'package:mobileapp/widgets/dialogs/comment_dialog.dart';
import 'package:mobileapp/widgets/images_page_view.dart';
import 'package:mobileapp/widgets/phone_list_widget.dart';

class ResHotelDetailsPage extends StatelessWidget {
  final Hotel hotel;

  const ResHotelDetailsPage({Key? key, required this.hotel}) : super(key: key);

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
      appBar: SimpleAppBar(title: hotel.name!),
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
                    child: ImagesPageView(imageList: ImageList.images),
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
                            hotel.name!,
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
                              url: hotel.karta,
                              text: 'Расположение на карте',
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
                          "Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at ",
                          style: AppTextStyle.regular(),
                        ),
                        SizedBox(height: 21.h),
                        // TODO: Serverdan kelgan ma'lumot bilan almashtiriladi
                        PhoneListWidget(phoneList: hotel.tell!)
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
      builder: (ctx) => CommentListDialog(headers: {'hotel_id': hotel.id!}),
    );
  }
}
