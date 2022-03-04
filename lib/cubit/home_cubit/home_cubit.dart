import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';

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
