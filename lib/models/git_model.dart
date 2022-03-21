
import 'dart:convert';

Git gitFromJson(String str) => Git.fromJson(json.decode(str));
String gitToJson(Git data) => json.encode(data.toJson());
class Git {
  Git({
    String? id,
    String? image,
    List<String>? languages,
    String? informUz,
    String? informEn,
    String? informRu,
    String? city,
    List<String>? tell,
    String? price,
    String? date,
    int? reyting,
    String? username,
    int? users,}){
    _id = id;
    _username = username;
    _image = image;
    _languages = languages;
    _informUz = informUz;
    _informEn = informEn;
    _informRu = informRu;
    _city = city;
    _tell = tell;
    _price = price;
    _date = date;
    _reyting = reyting;
    _users = users;
  }

  Git.fromJson(dynamic json) {
    _id = json['id'];
    _image = json['image'];
    _languages = json['languages'] != null ? json['languages'].cast<String>() : [];
    _informUz = json['inform_uz'];
    _informEn = json['inform_en'];
    _informRu = json['inform_ru'];
    _city = json['city'];
    _tell = json['tell'] != null ? json['tell'].cast<String>() : [];
    _price = json['price'];
    _date = json['date'];
    _reyting = json['reyting'];
    _users = json['users'];
    _username = json['username'];
  }
  String? _id;
  String? _image;
  String? _username;
  List<String>? _languages;
  String? _informUz;
  String? _informEn;
  String? _informRu;
  String? _city;
  List<String>? _tell;
  String? _price;
  String? _date;
  int? _reyting;
  int? _users;

  String? get id => _id;
  String? get image => _image;
  List<String>? get languages => _languages;
  String? get informUz => _informUz;
  String? get informEn => _informEn;
  String? get informRu => _informRu;
  String? get city => _city;
  List<String>? get tell => _tell;
  String? get price => _price;
  String? get date => _date;
  int? get reyting => _reyting;
  int? get users => _users;
  String? get username => _username;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['image'] = _image;
    map['languages'] = _languages;
    map['inform_uz'] = _informUz;
    map['inform_en'] = _informEn;
    map['inform_ru'] = _informRu;
    map['city'] = _city;
    map['tell'] = _tell;
    map['price'] = _price;
    map['date'] = _date;
    map['reyting'] = _reyting;
    map['users'] = _users;
    map['username'] = _username;
    return map;
  }

}