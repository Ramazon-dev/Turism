import 'package:flutter/material.dart';
import 'package:mobileapp/core/components/exporting_packages.dart';
import 'package:mobileapp/screens/on_boarding/initial_page.dart';
import 'package:mobileapp/services/restaurant_service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  // await dotenv.load(fileName: ".env");
  await GetStorage.init();
  await RestaurantService.fetchCategoriesOfRestaurants();
  print(GetStorage().read('restCategories'));

  runApp(
    EasyLocalization(
      supportedLocales: const [
        Locale('en', 'GB'),
        Locale('uz', 'UZ'),
        Locale('ru', 'RU'),
      ],
      path: 'assets/translations',
      fallbackLocale: const Locale('uz', 'UZ'),
      child: const MyApp(),
    ),
  );

  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarIconBrightness: Brightness.light,
    statusBarColor: Colors.transparent,
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Tourism App.',
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      theme: ThemeData(fontFamily: "Roboto", primarySwatch: Colors.blue),
      home: _hasCome() ? const HomeScreen() : const InitialPage(),
    );
  }

  bool _hasCome() => GetStorage().read('hasComeIn') ?? false;
}
