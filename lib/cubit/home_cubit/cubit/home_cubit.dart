import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:meta/meta.dart';
import 'package:mobileapp/screens/car/car_page.dart';
import 'package:mobileapp/screens/git/git_page.dart';
import 'package:mobileapp/screens/home/home_body.dart';
import 'package:mobileapp/screens/profile/profile_page.dart';
import 'package:mobileapp/screens/search/search_page.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());

  int _currentIndex = 2;

  void onPageChanged(int index) {
    _currentIndex = index;
    emit(HomeInitial());
  }

  final List<Widget> _pages = [
    const GitPage(),
    const SearchPage(),
    const HomeBodyPage(),
    const CarPage(),
    const ProfilePage(),
  ];

  int get currentIndex => _currentIndex;
  Widget get body => _pages[_currentIndex];
}
