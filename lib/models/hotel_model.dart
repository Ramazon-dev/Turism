class HotelModel {
  String? _name;
class Hotel {
  String? _id;
  String? _name;
  List<String>? _media;
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
  String? _date;
  String? _categoryId;
  int? _reyting;
  int? _users;

  Hotel(
      {String? id,
      String? name,
      List<String>? media,
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
      String? date,
      String? categoryId,
      int? reyting,
      int? users}) {
    if (id != null) {
      _id = id;
    }
    if (name != null) {
      _name = name;
    }
    if (media != null) {
      _media = media;
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
    if (date != null) {
      _date = date;
    }
    if (categoryId != null) {
      _categoryId = categoryId;
    }
    if (reyting != null) {
      _reyting = reyting;
    }
    if (users != null) {
      _users = users;
    }
  }

  String get id => _id!;

  String get name => _name!;

  List<String> get media => _media!;

  String get informUz => _informUz!;

  String get informEn => _informEn!;

  String get informRu => _informRu!;

  String get karta => _karta!;

  String get city => _city!;

  String get site => _site!;

  List<String> get tell => _tell!;

  String get date => _date!;

  String get categoryId => _categoryId!;

  int get reyting => _reyting!;

  int get users => _users!;

  Hotel.fromJson(Map<String, dynamic> json) {
    _id = json['id'];
    _name = json['name'];
    _media = json['media'].cast<String>();
    _informUz = json['inform_uz'];
    _informEn = json['inform_en'];
    _informRu = json['inform_ru'];
    _karta = json['karta'];
    _city = json['city'];
    _site = json['site'];
    _tell = json['tell'].cast<String>();
    _date = json['date'];
    _categoryId = json['category_id'];
    _reyting = json['reyting'];
    _users = json['users'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['id'] = _id;
    data['name'] = _name;
    data['media'] = _media;
    data['inform_uz'] = _informUz;
    data['inform_en'] = _informEn;
    data['inform_ru'] = _informRu;
    data['karta'] = _karta;
    data['city'] = _city;
    data['site'] = _site;
    data['tell'] = _tell;
    data['date'] = _date;
    data['category_id'] = _categoryId;
    data['reyting'] = _reyting;
    data['users'] = _users;
    return data;
  }
}
