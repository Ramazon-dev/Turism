import 'package:mobileapp/core/components/exporting_packages.dart';

class CityList {
  static List<CityModel> cities = [
    CityModel(LocaleKeys.tashkent.tr(), 'toshkent', _tashkent),
    CityModel(LocaleKeys.andijan.tr(), 'andijon', _andijan),
    CityModel(LocaleKeys.namangan.tr(), 'namangan', _namangan),
    CityModel(LocaleKeys.fergana.tr(), "farg'ona", _fergana),
    CityModel(LocaleKeys.sirdarya.tr(), 'sirdaryo', _sirdarya),
    CityModel(LocaleKeys.jizzakh.tr(), 'jizzax', _jizzakh),
    CityModel(LocaleKeys.samarkand.tr(), 'samarqand', _samarkand),
    CityModel(LocaleKeys.kashkadarya.tr(), 'qashqadaryo', _kashkadarya),
    CityModel(LocaleKeys.bukhara.tr(), 'buxoro', _bukhara),
    CityModel(LocaleKeys.khorezm.tr(), 'xorazm', _khorezm),
    CityModel(LocaleKeys.navai.tr(), 'navoi', _navai),
    CityModel(LocaleKeys.karakalpak.tr(), "qoraqalpog'iston", _karakalpak),
    CityModel(LocaleKeys.surkhandarya.tr(), 'surxondaryo', _surkhandarya),
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
      'https://storage.kun.uz/source/thumbnails/_medium/6/gAvm6KzUnTMMpAVW3mTyzVE-RHrdU0b5_medium.jpg';
  static const String _samarkand =
      "https://www.unchartedbackpacker.com/wp-content/uploads/2016/07/DSC_0124.jpg";
  static const String _bukhara =
      "https://media.istockphoto.com/photos/bukhara-uzbekistan-sunset-panorama-buxoro-aerial-view-picture-id1250377850?k=20&m=1250377850&s=170667a&w=0&h=v1n88UOrx1tE196Zzw8Hp8RhDYyCXKMXPvD944b2vx8=";

  static const String _andijan =
      "https://samarkanda-travel.com/wp-content/uploads/2017/02/Andijon-viloyati.jpg";
  static const String _namangan =
      "https://www.azernews.az/media/2020/03/26/uzbekistan_namangan_260320.jpg";
  static const String _fergana =
      "https://static.abt.uz/crop/600__5d5b7518ca265.jpg";
  static const String _sirdarya =
      "https://xs.uz/upload/post/2019/9/25/b7978e1a1fb3a73fddc4251b12a0e8f90925.jpg";
  static const String _kashkadarya =
      "https://darakchi.uz/storage/4a/b8/a6/148535/conversions/899-xl.jpg";
  static const String _khorezm =
      "https://www.azernews.az/media/2017/10/15/xorezm.jpg";
  static const String _navai =
      "https://uzbekistan.travel/storage/app/media/nargiza/cropped-images/cropped-images/Nurata_town-0-0-0-0-1583233278-0-0-0-0-1583233325.jpg";
  static const String _karakalpak =
      "http://storage.kun.uz/source/1/a3QTFHM_x_MGFsZrs7JQaHMrnr2z5kdz.jpg";
  static const String _surkhandarya =
      "https://uzbekistan.travel/storage/app/media/nargiza/cropped-images/DJI_0027-0-0-0-0-1583326943.jpg";
}
