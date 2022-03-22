import 'dart:convert';

TransportModel transportModelFromJson(String str) =>
    TransportModel.fromJson(json.decode(str));

String transportModelToJson(TransportModel data) => json.encode(data.toJson());

class TransportModel {
  TransportModel({
    String? id,
    String? owner,
    String? name,
    List<String>? media,
    String? informUz,
    String? informEn,
    String? informRu,
    String? city,
    List<String>? tell,
    String? price,
    String? date,
    String? categoryId,
    num? reyting,
    int? users,
  }) {
    _id = id;
    _owner = owner;
    _name = name;
    _media = media;
    _informUz = informUz;
    _informEn = informEn;
    _informRu = informRu;
    _city = city;
    _tell = tell;
    _price = price;
    _date = date;
    _categoryId = categoryId;
    _reyting = reyting;
    _users = users;
  }

  TransportModel.fromJson(dynamic json) {
    _id = json['id'];
    _owner = json['owner'];
    _name = json['name'];
    _media = json['media'] != null ? json['media'].cast<String>() : [];
    _informUz = json['inform_uz'];
    _informEn = json['inform_en'];
    _informRu = json['inform_ru'];
    _city = json['city'];
    _tell = json['tell'] != null ? json['tell'].cast<String>() : [];
    _price = json['price'];
    _date = json['date'];
    _categoryId = json['category_id'];
    _reyting = json['reyting'];
    _users = json['users'];
  }

  String? _id;
  String? _owner;
  String? _name;
  List<String>? _media;
  String? _informUz;
  String? _informEn;
  String? _informRu;
  String? _city;
  List<String>? _tell;
  String? _price;
  String? _date;
  String? _categoryId;
  num? _reyting;
  int? _users;

  String? get id => _id;

  String? get owner => _owner;

  String? get name => _name;

  List<String>? get media => _media;

  String? get informUz => _informUz;

  String? get informEn => _informEn;

  String? get informRu => _informRu;

  String? get city => _city;

  List<String>? get tell => _tell;

  String? get price => _price;

  String? get date => _date;

  String? get categoryId => _categoryId;

  num? get reyting => _reyting;

  int? get users => _users;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['owner'] = _owner;
    map['name'] = _name;
    map['media'] = _media;
    map['inform_uz'] = _informUz;
    map['inform_en'] = _informEn;
    map['inform_ru'] = _informRu;
    map['city'] = _city;
    map['tell'] = _tell;
    map['price'] = _price;
    map['date'] = _date;
    map['category_id'] = _categoryId;
    map['reyting'] = _reyting;
    map['users'] = _users;
    return map;
  }
}
