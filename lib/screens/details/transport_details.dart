import 'package:flutter/material.dart';
import 'package:mobileapp/core/components/exporting_packages.dart';
import 'package:mobileapp/widgets/top_bar/appbar_origin.dart';
import 'package:mobileapp/widgets/description_widjet.dart';

class TransportDetailPage extends StatelessWidget {
  // final CarModel car;
  final String carImage;
  final String carName;
  final String carPrice;
  final String carInfo;
  final List<String> carNumber;
  final int users;
  final double rating;

  const TransportDetailPage({
    Key? key,
    // required this.car,
    required this.carImage,
    required this.carInfo,
    required this.carName,
    required this.carPrice,
    required this.carNumber,
    required this.rating,
    required this.users,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    return Scaffold(
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
                                name: carName,
                                price: carPrice,
                                rating: rating,
                                users: users,
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
                            carInfo,
                            style: const TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                              fontFamily: 'Roboto',
                            ),
                          ),
                          SizedBox(
                            height: getHeight(50),
                            width: getWidth(120),
                            child: ListView.builder(
                              itemCount: carNumber.length,
                              itemBuilder: (context, index) {
                                return Row(
                                  children: [
                                    const Icon(
                                      Icons.call,
                                    ),
                                    TextButtonWidget(
                                      onPressed: () {
                                        _makePhoneCall(
                                          carNumber[index],
                                        );
                                      },
                                      label: carNumber[index],
                                    )
                                  ],
                                );
                              },
                            ),
                          ),
                          // ContactWidget(
                          //   commentOpen: () {},
                          // ),
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

  Future<void> _makePhoneCall(String phoneNumber) async {
    final Uri launchUri = Uri(scheme: 'tel', path: phoneNumber);
    await launch(launchUri.toString());
  }
}
