import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mobileapp/core/constants/app_icons.dart';
import 'package:mobileapp/cubit/home_cubit/cubit/home_cubit.dart';
import 'package:mobileapp/widgets/bottom_navigation_bar.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return BlocProvider(
      create: (_) => HomeCubit(),
      child: BlocBuilder<HomeCubit, HomeState>(
        builder: (context, state) {
          HomeCubit cubit = context.watch();
          return Scaffold(
            bottomNavigationBar: MyBottomNavigationBar(
              onTap: cubit.onPageChanged,
              currentIndex: cubit.currentIndex,
            ),
            body: cubit.body,
          );
        },
      ),
    );
  }
}
