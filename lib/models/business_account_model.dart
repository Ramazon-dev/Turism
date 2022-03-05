import 'dart:convert';
/// git : {"id":"a37ca999-9d85-486c-8192-e8547267195a","image":"image__9b4f9545-bc99-4787-9c55-3d9aa56cea35.jpg","languages":["uz","kz"],"inform_uz":"The intended recipient you are not the intended recipient you are not","inform_en":"Let me 😃😃 the following basic premise the following","inform_ru":"Hi ok thanks for the first time in the intended recipient you are not","city":"sirdaryo","tell":["998999666"],"price":"55525555555","date":"2022-03-05T10:58:40.793Z","reyting":0,"users":1}
/// restaurants : [{"id":"64072a2d-9b14-4d36-8cec-bcf540498a68","name":"Bizning Restoran","media":["image__07a974e9-ed04-4e26-b790-08765bd3b2c2.png"],"inform_uz":"INformUz","inform_en":"jkadsfhjkadhfjdahs","inform_ru":"IN form ru","karta":"https://goo.gl/maps/tV4zVprnkh7K6dGT7","city":"toshkent","site":null,"tell":["+9989321657","+9989898989"],"date":"2022-03-05T14:05:53.042Z","category_id":"903908cf-7f6d-424f-8c03-66d30e9347bf","reyting":0,"users":1}]
/// hotels : [{"id":"21b27bb5-48bb-42f3-8d1f-91fa035dd2ac","media":["image__a91e2d41-f820-405f-9d7b-6333c819a735.jpg"],"inform_uz":"4gg the intended recipient you are not the intended","inform_en":"You can see the attached file is scanned image in 6","inform_ru":"If you are not the intended recipient you are not the intended","karta":"Najot Ta'lim8 71 200 11 23https://maps.app.goo.gl/mS9wmqMcsVFCpA337","city":"toshkent","site":null,"tell":["[333333333]"],"date":"2022-03-05T11:34:05.873Z","category_id":"1991edea-7d4a-49fb-b627-79b777cf54ae","reyting":0,"users":1}]

BusinessAccountModel businessAccountFromJson(String str) => BusinessAccountModel.fromJson(json.decode(str));
String businessAccountToJson(BusinessAccountModel data) => json.encode(data.toJson());
class BusinessAccountModel {
  BusinessAccountModel({
      Git? git, 
      List<Restaurants>? restaurants, 
      List<Hotels>? hotels,}){
    _git = git;
    _restaurants = restaurants;
    _hotels = hotels;
}

  BusinessAccountModel.fromJson(dynamic json) {
    _git = json['git'] != null ? Git.fromJson(json['git']) : null;
    if (json['restaurants'] != null) {
      _restaurants = [];
      json['restaurants'].forEach((v) {
        _restaurants?.add(Restaurants.fromJson(v));
      });
    }
    if (json['hotels'] != null) {
      _hotels = [];
      json['hotels'].forEach((v) {
        _hotels?.add(Hotels.fromJson(v));
      });
    }
  }
  Git? _git;
  List<Restaurants>? _restaurants;
  List<Hotels>? _hotels;

  Git? get git => _git;
  List<Restaurants>? get restaurants => _restaurants;
  List<Hotels>? get hotels => _hotels;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_git != null) {
      map['git'] = _git?.toJson();
    }
    if (_restaurants != null) {
      map['restaurants'] = _restaurants?.map((v) => v.toJson()).toList();
    }
    if (_hotels != null) {
      map['hotels'] = _hotels?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

/// id : "21b27bb5-48bb-42f3-8d1f-91fa035dd2ac"
/// media : ["image__a91e2d41-f820-405f-9d7b-6333c819a735.jpg"]
/// inform_uz : "4gg the intended recipient you are not the intended"
/// inform_en : "You can see the attached file is scanned image in 6"
/// inform_ru : "If you are not the intended recipient you are not the intended"
/// karta : "Najot Ta'lim8 71 200 11 23https://maps.app.goo.gl/mS9wmqMcsVFCpA337"
/// city : "toshkent"
/// site : null
/// tell : ["[333333333]"]
/// date : "2022-03-05T11:34:05.873Z"
/// category_id : "1991edea-7d4a-49fb-b627-79b777cf54ae"
/// reyting : 0
/// users : 1

Hotels hotelsFromJson(String str) => Hotels.fromJson(json.decode(str));
String hotelsToJson(Hotels data) => json.encode(data.toJson());
class Hotels {
  Hotels({
      String? id, 
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
      int? users,}){
    _id = id;
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

  Hotels.fromJson(dynamic json) {
    _id = json['id'];
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

  String? get id => _id;
  List<String>? get media => _media;
  String? get informUz => _informUz;
  String? get informEn => _informEn;
  String? get informRu => _informRu;
  String? get karta => _karta;
  String? get city => _city;
  dynamic get site => _site;
  List<String>? get tell => _tell;
  String? get date => _date;
  String? get categoryId => _categoryId;
  int? get reyting => _reyting;
  int? get users => _users;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
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

}

/// id : "64072a2d-9b14-4d36-8cec-bcf540498a68"
/// name : "Bizning Restoran"
/// media : ["image__07a974e9-ed04-4e26-b790-08765bd3b2c2.png"]
/// inform_uz : "INformUz"
/// inform_en : "jkadsfhjkadhfjdahs"
/// inform_ru : "IN form ru"
/// karta : "https://goo.gl/maps/tV4zVprnkh7K6dGT7"
/// city : "toshkent"
/// site : null
/// tell : ["+9989321657","+9989898989"]
/// date : "2022-03-05T14:05:53.042Z"
/// category_id : "903908cf-7f6d-424f-8c03-66d30e9347bf"
/// reyting : 0
/// users : 1

Restaurants restaurantsFromJson(String str) => Restaurants.fromJson(json.decode(str));
String restaurantsToJson(Restaurants data) => json.encode(data.toJson());
class Restaurants {
  Restaurants({
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
      int? users,}){
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

  Restaurants.fromJson(dynamic json) {
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

  String? get id => _id;
  String? get name => _name;
  List<String>? get media => _media;
  String? get informUz => _informUz;
  String? get informEn => _informEn;
  String? get informRu => _informRu;
  String? get karta => _karta;
  String? get city => _city;
  dynamic get site => _site;
  List<String>? get tell => _tell;
  String? get date => _date;
  String? get categoryId => _categoryId;
  int? get reyting => _reyting;
  int? get users => _users;

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

}

/// id : "a37ca999-9d85-486c-8192-e8547267195a"
/// image : "image__9b4f9545-bc99-4787-9c55-3d9aa56cea35.jpg"
/// languages : ["uz","kz"]
/// inform_uz : "The intended recipient you are not the intended recipient you are not"
/// inform_en : "Let me 😃😃 the following basic premise the following"
/// inform_ru : "Hi ok thanks for the first time in the intended recipient you are not"
/// city : "sirdaryo"
/// tell : ["998999666"]
/// price : "55525555555"
/// date : "2022-03-05T10:58:40.793Z"
/// reyting : 0
/// users : 1

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
      int? users,}){
    _id = id;
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
  }
  String? _id;
  String? _image;
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
    return map;
  }

}