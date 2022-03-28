import 'package:flutter/material.dart';
import 'package:mobileapp/models/locale_model.dart';
import 'package:mobileapp/widgets/tiles/language_tile.dart';

class ChooseLanguagePage extends StatelessWidget {
  const ChooseLanguagePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children:
            LocaleData.localeList.map((e) => LanguageTile(locale: e)).toList(),
      ),
    );
  }
}
