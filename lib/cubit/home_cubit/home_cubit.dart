import 'package:bloc/bloc.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:meta/meta.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());

  // final ZoomDrawerController drawerController = ZoomDrawerController();

  // void openDrawer() {
  //   drawerController.toggle!.call();
  // }

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

// ZoomDrawerController get drawerController => _drawerController;
}
