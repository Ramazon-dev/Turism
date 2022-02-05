import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mobileapp/core/components/exporting_packages.dart';
import 'package:mobileapp/core/constants/app_icons.dart';
import 'package:mobileapp/cubit/home_cubit/cubit/home_cubit.dart';
import 'package:mobileapp/widgets/appbar_widget.dart';
import 'package:mobileapp/widgets/drawer_widget.dart';
import 'package:mobileapp/widgets/elevated_button_widget.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);

  TextEditingController _controller = TextEditingController();
  var scaffoldKey = GlobalKey<ScaffoldState>();
  List<String> listOfString = [
    AppIcons.arrowBack,
    AppIcons.arrowBackWhite,
    AppIcons.call,
    AppIcons.car,
    AppIcons.comment,
    AppIcons.dollar,
    AppIcons.drawer,
    AppIcons.email,
    AppIcons.favourite,
    AppIcons.git,
    AppIcons.home,
    AppIcons.language,
    AppIcons.link,
    AppIcons.location,
    AppIcons.personal,
    AppIcons.personalWhite,
    AppIcons.search,
  ];
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return BlocProvider(
      create: (_) => HomeCubit(),
      child: BlocBuilder<HomeCubit, HomeState>(
        builder: (context, state) {
          return Scaffold(
            key: scaffoldKey,
            drawer: const DrawerDiwget(),
            appBar: AppBarWidget(
              text: "Appbar",
              leading: InkWell(
                onTap: () {
                  scaffoldKey.currentState?.openDrawer();
                },
                child: Padding(
                  padding: const EdgeInsets.all(13),
                  child: SvgPicture.asset(
                    'assets/icons/drawer.svg',
                    color: Colors.black,
                    // height: 10,
                  ),
                ),
              ),
              actions: [
                SvgPicture.asset('assets/icons/language.svg'),
                SizedBox(width: getWidth(10)),
                Padding(
                  padding: EdgeInsets.only(
                    right: getWidth(20),
                  ),
                  child: SvgPicture.asset('assets/icons/dollar.svg'),
                ),
              ],
            ),
            body: SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    height: 400,
                    width: 300,
                    color: Colors.yellow,
                    child: ListView.builder(
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.only(top: 20),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Text(listOfString[index].toString()),
                              SvgPicture.asset(
                                listOfString[index],
                                height: 30,
                              ),
                            ],
                          ),
                        );
                      },
                      itemCount: listOfString.length,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(20),
                    child: TextFormFieldWidget(
                      hint: 'Login',
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(20),
                    child: ElevatedButtonWidget(
                      text: 'registratsiya',
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(20),
                    child: ElevatedButtonWidget(
                      text: 'registratsiya',
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
