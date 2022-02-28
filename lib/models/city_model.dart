class CityModel {
  late String _name;
  late String _imgUrl;

  CityModel(String name, String img) {
    _name = name;
    _imgUrl = img;
  }

  String get name => _name;

  String get imgUrl => _imgUrl;
}
