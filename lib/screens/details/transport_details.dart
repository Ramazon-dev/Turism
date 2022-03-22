import 'package:flutter/material.dart';
import 'package:mobileapp/core/components/exporting_packages.dart';
import 'package:mobileapp/widgets/phone_list_widget.dart';
import 'package:mobileapp/widgets/top_bar/appbar_origin.dart';
import 'package:mobileapp/widgets/description_widjet.dart';


class TransportDetailPage extends StatelessWidget {
  final TransportModel transport;

  const TransportDetailPage({Key? key, required this.transport}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    return Scaffold(
      resizeToAvoidBottomInset: false,
      floatingActionButton: _actionButton(context),
        appBar: AppBarOrigin(
          actions: SvgPicture.asset(AppIcons.language),
          actions2: SvgPicture.asset(AppIcons.dollar),
        ),
        body: Column(
          children: [
            Center(
              child: Container(
                margin: EdgeInsets.only(top: getHeight(20)),
                height: getHeight(592),
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
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(
                          Radius.circular(
                            getWidth(5),
                          ),
                        ),
                        image: const DecorationImage(
                          image: NetworkImage(
                            'https://source.unsplash.com/random/4',
                          ),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20.w),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              DescriptionWidget(
                                name: transport.name!,
                                price: transport.price!,
                                rating: transport.reyting!.toDouble(),
                                users: transport.users!,
                              ),
                            ],
                          ),
                          SizedBox(
                            height: getHeight(45),
                            width: getWidth(150),
                            child: RichText(
                              text: TextSpan(
                                children: [
                                  TextSpan(
                                    text: "02 Фев. 2022",
                                    style: TextStyle(
                                      fontSize: getWidth(12),
                                    ),
                                  ),
                                  const TextSpan(
                                    text: "10:00",
                                    style: TextStyle(
                                      color: AppColors.grey,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(height: 28.h),
                          Text(
                            transport.informEn!,
                            style: const TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                              fontFamily: 'Roboto',
                            ),
                          ),
                          PhoneListWidget(phoneList: transport.tell!)
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ));
  }

  FloatingActionButton _actionButton(BuildContext context) =>
      FloatingActionButton(
        onPressed: () => _onButtonPressed(context),
        backgroundColor: AppColors.black,
        child: SvgPicture.asset(AppIcons.comment),
      );

  void _onButtonPressed(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (ctx) => CommentListDialog(headers: {'transport_id': transport.id!}),
    );
  }
}
