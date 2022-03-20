import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../core/components/exporting_packages.dart';

part 'hotel_state.dart';

class HotelCubit extends Cubit<HotelState> {
  HotelCubit() : super(HotelInitial());
  CityModel _city = CityList.cities[0];

  void onCityChanged(CityModel city) {
    _city = city;
    emit(HotelInitial());
  }

  void onTabChanged(int i) {
    _city = CityList.cities[i];
    emit(HotelInitial());
  }

  CityModel get city => _city;
}
