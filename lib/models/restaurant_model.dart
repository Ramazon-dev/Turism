import 'dart:convert';

Restaurant restaurantsFromJson(String str) =>
    Restaurant.fromJson(json.decode(str));

String restaurantsToJson(Restaurant data) => json.encode(data.toJson());

class Restaurant {
  Restaurant({
    String? id,
    String? name,
    List<String>? media,
    String? informUz,
    String? informEn,
    String? informRu,
    String? karta,
    String? city,
    dynamic site,
    List<String>? tell,
    String? date,
    String? categoryId,
    int? reyting,
    int? users,
  }) {
    _id = id;
    _name = name;
    _media = media;
    _informUz = informUz;
    _informEn = informEn;
    _informRu = informRu;
    _karta = karta;
    _city = city;
    _site = site;
    _tell = tell;
    _date = date;
    _categoryId = categoryId;
    _reyting = reyting;
    _users = users;
  }

  Restaurant.fromJson(dynamic json) {
    _id = json['id'];
    _name = json['name'];
    _media = json['media'] != null ? json['media'].cast<String>() : [];
    _informUz = json['inform_uz'];
    _informEn = json['inform_en'];
    _informRu = json['inform_ru'];
    _karta = json['karta'];
    _city = json['city'];
    _site = json['site'];
    _tell = json['tell'] != null ? json['tell'].cast<String>() : [];
    _date = json['date'];
    _categoryId = json['category_id'];
    _reyting = json['reyting'];
    _users = json['users'];
  }

  String? _id;
  String? _name;
  List<String>? _media;
  String? _informUz;
  String? _informEn;
  String? _informRu;
  String? _karta;
  String? _city;
  dynamic _site;
  List<String>? _tell;
  String? _date;
  String? _categoryId;
  int? _reyting;
  int? _users;

  String? get id => _id!;

  String? get name => _name!;

  List<String>? get media => _media!;

  String? get informUz => _informUz!;

  String? get informEn => _informEn!;

  String? get informRu => _informRu!;

  String? get karta => _karta!;

  String? get city => _city!;

  dynamic get site => _site.toString();

  List<String>? get tell => _tell!;

  String? get date => _date!;

  String? get categoryId => _categoryId!;

  int? get reyting => _reyting!;

  int? get users => _users!;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['name'] = _name;
    map['media'] = _media;
    map['inform_uz'] = _informUz;
    map['inform_en'] = _informEn;
    map['inform_ru'] = _informRu;
    map['karta'] = _karta;
    map['city'] = _city;
    map['site'] = _site;
    map['tell'] = _tell;
    map['date'] = _date;
    map['category_id'] = _categoryId;
    map['reyting'] = _reyting;
    map['users'] = _users;
    return map;
  }

  @override
  String toString() {
    return "Restaurant: {name: $name, media: $media, category: $categoryId, site: $site, tell: $tell, city: $city, karta: $karta, infoRu: $informRu, infoEn: $informEn ,infoUz: $informUz}";
  }
}
