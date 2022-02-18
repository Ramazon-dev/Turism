import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:mobileapp/core/components/exporting_packages.dart';
import 'package:mobileapp/services/hotel_service.dart';

part 'hotel_state.dart';

class HotelCubit extends Cubit<HotelState> {
  HotelCubit() : super(HotelInitial());

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _websiteController = TextEditingController();
  final TextEditingController _mapLinkController = TextEditingController();
  final TextEditingController _priceController = TextEditingController();
  final TextEditingController _aboutUzController = TextEditingController();
  final TextEditingController _aboutEnController = TextEditingController();
  final TextEditingController _aboutRuController = TextEditingController();

  String _city = 'Tashkent';


  void cityChanged(dynamic value) {
    _city = value;
    emit(HotelInitial());
  }

  void onDropdownMenuItemPressed() {

  }

  void onSavePressed() {
    // Agar validate bo'lgan bo'lsa
    if(_formKey.currentState!.validate()) {
      String name = _nameController.text.trim();
      String phone = _phoneController.text.trim();
      String link = _websiteController.text.trim();
      String map = _mapLinkController.text.trim();
      String aboutUz = _aboutUzController.text.trim();
      String aboutEn = _aboutEnController.text.trim();
      String aboutRu = _aboutRuController.text.trim();

      Hotel hotel = Hotel(
        name: name,
        categoryId: '',
        city: _city,
        informEn: aboutEn,
        informUz: aboutUz,
        informRu: aboutRu,
        karta: map,
        site: link,
        tell: [phone],
        date: DateTime.now().toString(),
      );

      HotelService.createNewHotel( hotel).then((value) {

      });
    }
  }

  TextEditingController get nameController => _nameController;

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
