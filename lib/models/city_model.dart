class CityModel {
  late String _name;
  late String _imgUrl;
  late String _value;

  CityModel(String name, String value, String img) {
    _name = name;
    _imgUrl = img;
    _value = value;
  }

  String get name => _name;

  String get imgUrl => _imgUrl;

  String get value => _value;
}
