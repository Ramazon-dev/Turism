import 'package:flutter/material.dart';
import 'package:mobileapp/core/components/exporting_packages.dart';
import 'package:mobileapp/cubit/home_cubit/cubit/home_cubit.dart';
import 'package:mobileapp/widgets/appbar_origin.dart';
import 'package:mobileapp/widgets/drawer_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return BlocProvider(
      create: (_) => HomeCubit(),
      child: BlocBuilder<HomeCubit, HomeState>(
        builder: (context, state) {
          HomeCubit cubit = context.watch();
          return Scaffold(
            appBar: AppBarOrigin(
              text: 'Appbar Origin',
              actions: SvgPicture.asset(
                AppIcons.language,
                color: AppColors.white,
              ),
              actions2: SvgPicture.asset(AppIcons.dollar),
            ),
            drawer: const DrawerDiwget(),
            body: _pages()[cubit.currentIndex],
            bottomNavigationBar: BottomNavBarWidget(
              onTap: cubit.onPageChanged,
              currentIndex: cubit.currentIndex,
            ),
          );
        },
      ),
    );
  }

  List<Widget> _pages() => [
        const GitPage(),
        const SearchPage(),
        const HomeBody(),
        const CarPage(),
        const ProfilePage(),
      ];
}
