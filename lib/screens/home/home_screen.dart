import 'package:flutter/material.dart';
import 'package:mobileapp/core/components/exporting_packages.dart';
import 'package:mobileapp/cubit/home_cubit/home_cubit.dart';
import 'package:mobileapp/widgets/top_bar/appbar_origin.dart';
import 'package:mobileapp/widgets/drawer_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    CustomNavigator().init(context);
    return BlocProvider(
      create: (_) => HomeCubit(),
      child: BlocBuilder<HomeCubit, HomeState>(
        builder: (context, state) {
          HomeCubit cubit = context.watch();
          return Scaffold(
            key: cubit.scaffoldKey,
            appBar: _appBarList(cubit)[cubit.currentIndex],
            drawer: const DrawerWidget(),
            body: _pages(cubit)[cubit.currentIndex],
            bottomNavigationBar: BottomNavBarWidget(
              onTap: cubit.onPageChanged,
              currentIndex: cubit.currentIndex,
            ),
          );
        },
      ),
    );
  }

  List<Widget> _pages(HomeCubit cubit) => [
        const GitPage(),
        SearchPage(),
        HomeBody(cubit: cubit),
        const CarPage(),
        ProfilePage(),
      ];

  List<PreferredSizeWidget?> _appBarList(HomeCubit cubit) => [
        AppBarOrigin(
          actions: SvgPicture.asset(AppIcons.language),
          actions2: SvgPicture.asset(AppIcons.dollar),
        ),
        AppBarOrigin(
          actions: SvgPicture.asset(AppIcons.language),
          actions2: SvgPicture.asset(AppIcons.dollar),
        ),
        AppBarOrigin(
          actions: SvgPicture.asset(AppIcons.language),
          actions2: SvgPicture.asset(AppIcons.dollar),
        ),
        AppBarOrigin(
          actions: SvgPicture.asset(AppIcons.language),
          actions2: SvgPicture.asset(AppIcons.dollar),
        ),
        ProfileAppBar(cubit: cubit)
      ];
}
