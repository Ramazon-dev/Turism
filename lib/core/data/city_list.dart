import 'package:mobileapp/core/components/exporting_packages.dart';
import 'package:mobileapp/models/city_model.dart';

class CityList {
  static List<CityModel> cities = [
    CityModel(LocaleKeys.tashkent.tr(), 'toshkent', _tashkent),
    CityModel(LocaleKeys.andijan.tr(), 'andijon', _tashkent),
    CityModel(LocaleKeys.namangan.tr(), 'namangan', _tashkent),
    CityModel(LocaleKeys.fergana.tr(), "farg'ona", _tashkent),
    CityModel(LocaleKeys.sirdarya.tr(), 'sirdaryo', _tashkent),
    CityModel(LocaleKeys.jizzakh.tr(), 'jizzax', _jizzakh),
    CityModel(LocaleKeys.samarkand.tr(), 'samarqand', _samarkand),
    CityModel(LocaleKeys.kashkadarya.tr(), 'qashqadaryo', _tashkent),
    CityModel(LocaleKeys.bukhara.tr(), 'buxoro', _bukhara),
    CityModel(LocaleKeys.khorezm.tr(), 'xorazm', _tashkent),
    CityModel(LocaleKeys.navai.tr(), 'navoi', _tashkent),
    CityModel(LocaleKeys.karakalpak.tr(), "qoraqalpog'iston", _tashkent),
    CityModel(LocaleKeys.surkhandarya.tr(), 'surxondaryo', _tashkent),
  ];

  String getCity(String cityKey) {
    String city = cityKey;
    for (var element in cities) {
      if (cityKey == element.name) {
        city = element.value;
        break;
      }
    }
    return city;
  }

  String getCityName(String key) {
    String city = key;
    for (var element in cities) {
      if (key == element.value) {
        city = element.name;
        break;
      }
    }
    return city;
  }

  static const String _tashkent =
      'https://images.unsplash.com/photo-1622030797403-fa221ce5d208?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1025&q=80';
  static const String _jizzakh =
      'https://images.unsplash.com/photo-1627646394506-5f23bb5ccaaf?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=687&q=80';
  static const String _samarkand =
      "https://images.unsplash.com/photo-1636308625150-79a17ded193d?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1171&q=80";
  static const String _bukhara =
      'https://images.unsplash.com/photo-1603221197221-e9b151b5c83e?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1074&q=80';
}
