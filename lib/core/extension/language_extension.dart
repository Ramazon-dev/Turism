import 'package:flutter/cupertino.dart';

class LanguageClass {
  static Locale _locale = const Locale('uz', 'UZ');
  static void init(Locale locale) {
    _locale = locale;
  }

  static Locale get locale => _locale;


}

extension LanguageExtension on String {

}
