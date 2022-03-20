import 'package:flutter/material.dart';
import 'package:mobileapp/core/components/exporting_packages.dart';
import 'package:mobileapp/cubit/car_cubit/car_cubit.dart';
import 'package:mobileapp/models/tnas_models.dart';
import 'package:mobileapp/services/car_service.dart';
import 'package:mobileapp/widgets/cards/car_info_card.dart';

class CarPage extends StatelessWidget {
  const CarPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return BlocProvider(
      create: (_) => CarCubit(),
      child: BlocBuilder<CarCubit, CarState>(
        builder: (context, state) {
          CarCubit cubit = context.watch();
          return Column(
            children: [
              CityListWidget(
                onCityChanged: cubit.onCityChanged,
                cityName: cubit.city.name,
              ),
              SizedBox(
                height: getHeight(570),
                width: MediaQuery.of(context).size.width,
                child: FutureBuilder(
                  future: TransportServisec.getDataFromApi(),
                  builder:
                      (context, AsyncSnapshot<TransportModelsssssss> snap) {
                    if (snap.hasError) {
                      return const Center(
                        child: Text("Internet conntection has error"),
                      );
                    } else if (snap.hasData) {
                      var data = snap.data;
                      debugPrint('data keldi mana ${snap.data!}');
                      return GridView.builder(
                        padding: MyEdgeInsets.symmetric(h: 16.0, v: 25.0),
                        itemCount: data!.data!.length,
                        itemBuilder: (ctx, i) {
                          debugPrint("rasm url qismi ${data.data![i].media}");

                          return CarInfoCard(
                            // car: MockData.carModel,
                            carImage: data.data![i].media![0],
                            carName: data.data![i].name!,
                            carPrice: data.data![i].price!,
                            carInfo: data.data![i].informUz!,
                            carNumber: data.data![i].tell!,
                            rating: data.data![i].reyting!,
                            users: data.data![i].users!,
                          );
                        },
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          mainAxisExtent: 230.h,
                          crossAxisSpacing: getWidth(8.0),
                          mainAxisSpacing: getHeight(20.0),
                        ),
                      );
                    } else {
                      return const CircularProgressIndicator();
                    }
                  },
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
