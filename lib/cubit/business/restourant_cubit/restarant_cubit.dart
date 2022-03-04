import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:mobileapp/core/data/city_list.dart';

part 'restaurant_state.dart';

class RestaurantCubit extends Cubit<RestorantState> {
  RestaurantCubit() : super(RestorantInitial());


  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _websiteController = TextEditingController();
  final TextEditingController _mapLinkController = TextEditingController();
  final TextEditingController _priceController = TextEditingController();
  final TextEditingController _aboutUzController = TextEditingController();
  final TextEditingController _aboutEnController = TextEditingController();
  final TextEditingController _aboutRuController = TextEditingController();

  String _city = CityList.cities[0].name;
  String _chosenCity = CityList().getCity(CityList.cities[0].name);


  void cityChanged(dynamic value) {
    _city = value;
    _chosenCity = CityList().getCity(_city);
    emit(RestorantInitial());
  }

  void onDropdownMenuItemPressed() {

  }

  void onSavePressed() {
    // Agar validate bo'lgan bo'lsa
    if(_formKey.currentState!.validate()) {

    }
  }

  TextEditingController get phoneController => _phoneController;


  TextEditingController get websiteController => _websiteController;

  TextEditingController get priceController => _priceController;

  TextEditingController get aboutUzController => _aboutUzController;

  TextEditingController get aboutEnController => _aboutEnController;

  TextEditingController get aboutRuController => _aboutRuController;

  GlobalKey<FormState> get formKey => _formKey;

  String get city => _city;

  TextEditingController get mapLinkController => _mapLinkController;

}
