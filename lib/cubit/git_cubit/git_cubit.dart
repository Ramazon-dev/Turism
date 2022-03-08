import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:mobileapp/core/data/city_list.dart';
import 'package:mobileapp/models/city_model.dart';

part 'git_state.dart';

class GitCubit extends Cubit<GitState> {
  GitCubit() : super(GitInitial());

  CityModel _city = CityList.cities[0];

  void onCityChanged(CityModel city) {
    _city = city;
    emit(GitInitial());
  }

  CityModel get city => _city;
}
