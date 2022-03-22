import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:mobileapp/core/data/city_list.dart';
import 'package:mobileapp/models/city_model.dart';

part 'car_state.dart';

class CarCubit extends Cubit<CarState> {
  CarCubit() : super(CarInitial());

    CityModel _city = CityList.cities[0];

  void onCityChanged(CityModel city) {
    _city = city;
    emit(CarInitial());
  }

  CityModel get city => _city;

}
