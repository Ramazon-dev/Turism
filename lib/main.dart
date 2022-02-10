import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:mobileapp/core/components/exporting_packages.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:mobileapp/screens/auth/sing_up/sign_up_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  await dotenv.load(fileName: ".env");
  await GetStorage.init();

  runApp(
    EasyLocalization(
      supportedLocales: const [
        Locale('en', 'US'),
        Locale('uz', 'UZ'),
        Locale('ru', 'RU'),
      ],
      path: 'assets/translations',
      fallbackLocale: const Locale('uz', 'UZ'),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Tourism',
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      theme: ThemeData(
        fontFamily: "Roboto",
        primarySwatch: Colors.blue,
      ),
      home: HomeScreen(),
    );
  }
}
