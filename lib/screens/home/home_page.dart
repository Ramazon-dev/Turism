import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mobileapp/core/components/exporting_packages.dart';
import 'package:mobileapp/core/constants/app_icons.dart';
import 'package:mobileapp/cubit/home_cubit/cubit/home_cubit.dart';
import 'package:mobileapp/widgets/appbar_widget.dart';
import 'package:mobileapp/widgets/bottom_nav_bar.dart';
import 'package:mobileapp/widgets/drawer_widget.dart';
import 'package:mobileapp/widgets/elevated_button_widget.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return BlocProvider(
      create: (_) => HomeCubit(),
      child: BlocBuilder<HomeCubit, HomeState>(
        builder: (context, state) {
          HomeCubit cubit = context.watch();
          return Scaffold(
            bottomNavigationBar: BottomNavBarWidget(
              onTap: cubit.onPageChanged,
              currentIndex: cubit.currentIndex,
            ),
          );
        },
      ),
    );
  }
}
