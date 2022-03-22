import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';

part 'language_state.dart';

class LanguageCubit extends Cubit<LanguageState> {
  Locale _locale = const Locale('uz', 'UZ');
  LanguageCubit() : super(LanguageInitial());


  void onLocaleChanged(Locale locale) {
    _locale = locale;
    emit(LanguageInitial());
  }

  set setLocale(Locale locale) => _locale = locale;
  Locale get locale => _locale;
}
