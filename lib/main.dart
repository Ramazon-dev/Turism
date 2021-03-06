import 'package:flutter/material.dart';
import 'package:mobileapp/core/components/exporting_packages.dart';
import 'package:mobileapp/models/locale_model.dart';
import 'package:mobileapp/screens/on_boarding/initial_page.dart';
import 'package:mobileapp/services/car_service.dart';
import 'package:mobileapp/services/restaurant_service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  await GetStorage.init();
  await RestaurantService.fetchCategoriesOfRestaurants();
  await TransportService.fetchCategoriesOfCars();

  runApp(
    EasyLocalization(
      supportedLocales: LocaleData.localeList.map((e) => e.locale).toList(),
      path: LocaleData.path,
      fallbackLocale: LocaleData.localeList[0].locale,
      child: const MyApp(),
    ),
  );

  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarIconBrightness: Brightness.light,
    statusBarColor: Colors.transparent,
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        minTextAdapt: true,
        splitScreenMode: true,
        designSize: const Size(375.0, 812.0),
        builder: () => MaterialApp(
              debugShowCheckedModeBanner: false,
              title: 'Tourism App.',
              localizationsDelegates: context.localizationDelegates,
              supportedLocales: context.supportedLocales,
              locale: context.locale,
              theme:
                  ThemeData(fontFamily: "Roboto", primarySwatch: Colors.blue),
              home: _hasCome() ? const HomeScreen() : const InitialPage(),
            ));
  }

  bool _hasCome() => GetStorage().read('hasComeIn') ?? false;
}
