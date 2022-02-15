import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

part 'hotel_state.dart';

class HotelCubit extends Cubit<HotelState> {
  HotelCubit() : super(HotelInitial());

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _phoneController = TextEditingController();
  // final TextEditingController _cityController = TextEditingController();
  final TextEditingController _priceController = TextEditingController();
  final TextEditingController _aboutUzController = TextEditingController();
  final TextEditingController _aboutEnController = TextEditingController();
  final TextEditingController _aboutRuController = TextEditingController();

  String _city = 'Tashkent';


  bool _hasEng = false;
  bool _hasUzb = false;
  bool _hasRus = false;
  bool _hasKaz = false;

  void onEngPressed(bool? value) {
    _hasEng = value!;
    emit(HotelInitial());
  }

  void onRusPressed(bool? value) {
    _hasRus = value!;
    emit(HotelInitial());
  }

  void onUzbPressed(bool? value) {
    _hasUzb = value!;
    emit(HotelInitial());
  }

  void onKazPressed(bool? value) {
    _hasKaz = value!;
    emit(HotelInitial());
  }

  void cityChanged(dynamic value) {
    _city = value;
    emit(HotelInitial());
  }

  void onDropdownMenuItemPressed() {

  }

  void onSavePressed() {}

  TextEditingController get phoneController => _phoneController;

  // TextEditingController get cityController => _cityController;

  TextEditingController get priceController => _priceController;

  TextEditingController get aboutUzController => _aboutUzController;

  TextEditingController get aboutEnController => _aboutEnController;

  TextEditingController get aboutRuController => _aboutRuController;

  GlobalKey<FormState> get formKey => _formKey;

  bool get hasEng => _hasEng;

  bool get hasUzb => _hasUzb;

  bool get hasRus => _hasRus;

  bool get hasKaz => _hasKaz;

  String get city => _city;
}
