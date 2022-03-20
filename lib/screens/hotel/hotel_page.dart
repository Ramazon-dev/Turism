import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mobileapp/core/components/exporting_packages.dart';
import 'package:mobileapp/cubit/hotel_cubit/hotel_cubit.dart';
import 'package:mobileapp/screens/details/hotel_details_page.dart';

class HotelListPage extends StatelessWidget {
  const HotelListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => HotelCubit(),
      child: BlocBuilder<HotelCubit, HotelState>(
        builder: (ctx, state) {
          HotelCubit cubit = ctx.watch();
          return Scaffold(
            appBar: const SimpleAppBar(title: 'Hotel'),
            body: SingleChildScrollView(
              child: Column(
                children: [
                  CityListWidget(
                    onCityChanged: cubit.onCityChanged,
                    cityName: cubit.city.name,
                  ),
                  FutureBuilder(
                      future:
                          HotelService().fetchHotelsByCity(cubit.city.value),
                      builder: (context, AsyncSnapshot<List<Hotel>> snap) {
                        if (snap.hasError) {
                          return const Text('Error');
                        } else if (snap.hasData) {
                          if (snap.data!.isEmpty) {
                            return const EmptyPageWidget();
                          }

                          return GridView.builder(
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              padding: MyEdgeInsets.symmetric(h: 15.0, v: 20.0),
                              gridDelegate: _gridDelegate(),
                              itemCount: snap.data!.length,
                              itemBuilder: (ctx, i) {
                                Hotel hotel = snap.data![i];
                                String img = hotel.media[0]
                                    .toString()
                                    .replaceAll('k__image__', '');

                                return _buildHotelLayout(img, hotel);
                              });
                        }
                        return const CupertinoActivityIndicator();
                      }),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  InkWell _buildHotelLayout(String img, Hotel hotel) {
    return InkWell(
      onTap: () {
        CustomNavigator.push(ResHotelDetailsPage(hotel: hotel));
      },
      borderRadius: MyBorderRadius.circular(radius: 7.0),
      child: Container(
        alignment: Alignment.bottomCenter,
        decoration: MyDecoration.netImage(netImage: img, radius: 7.0),
        child: GlassContainer(
          width: getWidth(375.0),
          height: getHeight(64.0),
          borderRadius: MyBorderRadius.circular(radius: 7.0),
          child: Padding(
            padding: MyEdgeInsets.symmetric(h: 5.0, v: 12.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  hotel.name,
                  style: AppTextStyle.medium(color: AppColors.white),
                ),
                Text(
                  hotel.site.toString(),
                  maxLines: 1,
                  style: AppTextStyle.medium(color: AppColors.grey),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  SliverGridDelegateWithFixedCrossAxisCount _gridDelegate() {
    return SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: getHeight(20.0),
        crossAxisSpacing: getWidth(15.0),
        childAspectRatio: 0.7);
  }
}
