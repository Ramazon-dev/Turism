import 'package:flutter/cupertino.dart';
import 'package:mobileapp/core/components/exporting_packages.dart';

class LocaleModel {
  final Locale locale;
  final String name;
  final String nativeName;
  final String flag;

  LocaleModel(this.locale, this.name, this.nativeName, this.flag);
}

class LocaleData {
  static final List<LocaleModel> _localeLis = [
    LocaleModel(const Locale('uz', 'UZ'), 'Uzbek', "O'zbekcha", AppIcons.flagUZ),
    LocaleModel(const Locale('en', 'US'), 'English', "English", AppIcons.flagGB),
    LocaleModel(const Locale('ru', 'RU'), 'Russian', "Русский", AppIcons.flagRU),
  ];

  static List<LocaleModel> get localeList => _localeLis;
}