import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());

  int _currentIndex = 2;

  void onPageChanged(int index) {
    _currentIndex = index;
    emit(HomeInitial());
  }

  int get currentIndex => _currentIndex;
}
