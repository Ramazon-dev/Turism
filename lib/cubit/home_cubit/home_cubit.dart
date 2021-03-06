import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:mobileapp/models/locale_model.dart';

import '../../services/locale_service.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());

  final ZoomDrawerController _drawerController = ZoomDrawerController();

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  void openZoomDrawer() {
    _drawerController.toggle?.call();
    emit(HomeInitial());
  }

  void openDrawer() {
    _scaffoldKey.currentState!.openDrawer();
  }

  void onLanguageChanged(BuildContext context, String code) async {
    List<LocaleModel> _list = LocaleData.localeList;

    switch (code) {
      case 'uz':
        await context.setLocale(_list[0].locale);
        await LocaleService.setLocale(context.locale.languageCode);
        break;
      case 'en':
        await context.setLocale(_list[1].locale);
        await LocaleService.setLocale(context.locale.languageCode);
        break;
      case 'ru':
        await context.setLocale(_list[2].locale);
        await LocaleService.setLocale(context.locale.languageCode);
        break;
    }
    emit(HomeInitial());
  }

  GlobalKey<ScaffoldState> get scaffoldKey => _scaffoldKey;

  int _categoryIndex = 0;

  int _currentIndex = 2;

// bu page ozgarishi uchun
  void onPageChanged(int index) {
    _currentIndex = index;
    emit(HomeInitial());
  }

// bu category list uchun
  void onCategoryChanged(int index) {
    _categoryIndex = index;
    emit(HomeInitial());
  }

  int get currentIndex => _currentIndex;

  int get categoryIndex => _categoryIndex;

  ZoomDrawerController get drawerController => _drawerController;
}
