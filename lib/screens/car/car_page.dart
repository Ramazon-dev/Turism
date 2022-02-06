import 'package:flutter/material.dart';
import 'package:mobileapp/core/components/exporting_packages.dart';
import 'package:mobileapp/cubit/car_cubit/car_cubit.dart';

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
          return const Center(
            child: Text("Car Page"),
          );
        },
      ),
    );
  }
}
