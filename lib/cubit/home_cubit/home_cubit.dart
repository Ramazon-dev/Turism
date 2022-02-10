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

  void onPageChanged(int index) {
    _categoryIndex = index;
    emit(HomeInitial());
  }


  void onCategoryChanged(int index) {
    _categoryIndex = index;
    emit(HomeInitial());
  }

  int get currentIndex => _currentIndex;

  int get categoryIndex => _categoryIndex;

// ZoomDrawerController get drawerController => _drawerController;
}
