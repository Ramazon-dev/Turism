class HotelModel {
  String? _name;
  String? _informUz;
  String? _informEn;
  String? _informRu;
  String? _karta;
  String? _city;
  String? _site;
  List<String>? _tell;
  String? _categoryId;
  List<String>? _media;

  HotelModel(
      {String? name,
      String? informUz,
      String? informEn,
      String? informRu,
      String? karta,
      String? city,
      String? site,
      List<String>? tell,
      String? categoryId,
      List<String>? media}) {
    if (name != null) {
      _name = name;
    }
    if (informUz != null) {
      _informUz = informUz;
    }
    if (informEn != null) {
      _informEn = informEn;
    }
    if (informRu != null) {
      _informRu = informRu;
    }
    if (karta != null) {
      _karta = karta;
    }
    if (city != null) {
      _city = city;
    }
    if (site != null) {
      _site = site;
    }
    if (tell != null) {
      _tell = tell;
    }
    if (categoryId != null) {
      _categoryId = categoryId;
    }
    if (media != null) {
      _media = media;
    }
  }

  HotelModel.fromJson(Map<String, dynamic> json) {
    _name = json['name'];
    _informUz = json['inform_uz'];
    _informEn = json['inform_en'];
    _informRu = json['inform_ru'];
    _karta = json['karta'];
    _city = json['city'];
    _site = json['site'];
    _tell = json['tell'];
    _categoryId = json['category_id'];
    _media = json['media'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['name'] = _name;
    data['inform_uz'] = _informUz;
    data['inform_en'] = _informEn;
    data['inform_ru'] = _informRu;
    data['karta'] = _karta;
    data['city'] = _city;
    data['site'] = _site;
    data['tell'] = _tell;
    data['category_id'] = _categoryId;
    data['media'] = _media;
    return data;
  }

  String? get name => _name;
  String? get informUz => _informUz;
  String? get informEn => _informEn;
  String? get informRu => _informRu;
  String? get karta => _karta;
  String? get city => _city;
  String? get site => _site;
  List<String>? get tell => _tell;
  String? get categoryId => _categoryId;
  List<String>? get media => _media;
}
