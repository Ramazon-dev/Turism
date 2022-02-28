import 'package:mobileapp/models/city_model.dart';

class CityList {
  static List<CityModel> cities =[
    CityModel('Tashkent', _tashkent),
    CityModel('Andijan', _tashkent),
    CityModel('Ferghana', _tashkent),
    CityModel('Namangan', _tashkent),
    CityModel('Sirdarya', _tashkent),
    CityModel('Jizzakh', _tashkent),
    CityModel('Samarkand', _tashkent),
    CityModel('Karshi', _tashkent),
    CityModel('Nukus', _tashkent),
    CityModel('Navoi', _tashkent),
    CityModel('Khorazim', _tashkent),
    CityModel('Bukhara', _tashkent),
    CityModel('Surkandarya', _tashkent),
  ];
  
  static const String _tashkent = 'https://images.unsplash.com/photo-1622030797403-fa221ce5d208?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1025&q=80';
}