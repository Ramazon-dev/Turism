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

  int _currentIndex = 2;

  void onPageChanged(int index) {
    _currentIndex = index;
    emit(HomeInitial());
  }

  int get currentIndex => _currentIndex;

// ZoomDrawerController get drawerController => _drawerController;
}
