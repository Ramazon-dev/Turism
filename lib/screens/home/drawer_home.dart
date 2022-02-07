import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:mobileapp/core/components/exporting_packages.dart';
import 'package:mobileapp/cubit/home_cubit/cubit/home_cubit.dart';
import 'package:mobileapp/widgets/top_bar/app_drawer.dart';

class HomeDrawer extends StatelessWidget {
  const HomeDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => HomeCubit(),
      child: BlocBuilder<HomeCubit, HomeState>(
        builder: (ctx, state) {
          HomeCubit cubit = ctx.watch();
          return const ZoomDrawer(
            // controller: cubit.drawerController,
            menuScreen: const Scaffold(),
            mainScreen: const HomeScreen(),
          );
        },
      ),
    );
  }
}
