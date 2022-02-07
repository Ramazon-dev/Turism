import 'package:flutter/material.dart';
import 'package:mobileapp/core/components/exporting_packages.dart';
import 'package:mobileapp/cubit/car_cubit/car_cubit.dart';
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
          return GridView.builder(
              padding: MyEdgeInsets.symmetric(h: 16.0, v: 25.0),
              itemCount: 45,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 0.75,
                crossAxisSpacing: getWidth(8.0),
                mainAxisSpacing: getHeight(20.0),
              ),
              itemBuilder: (ctx, i) {
                return CarInfoCard(car: MockData.carModel);
              });
        },
      ),
    );
  }
}
