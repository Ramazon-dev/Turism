class Hotel {
  String? _id;
  String? _nameUz;
  String? _nameEn;
  String? _nameRu;
  List<String>? _media;
  String? _informUz;
  String? _informEn;
  String? _informRu;
  String? _karta;
  String? _city;
  String? _site;
  List<String>? _tell;
  String? _date;
  String? _categoryId;
  int? _reyting;
  int? _users;

  Hotel(
      {String? id,
      String? nameUz,
      String? nameEn,
      String? nameRu,
      List<String>? media,
      String? informUz,
      String? informEn,
      String? informRu,
      String? karta,
      String? city,
      String? site,
      List<String>? tell,
      String? date,
      String? categoryId,
      int? reyting,
      int? users}) {
    if (id != null) {
      _id = id;
    }
    if (nameUz != null) {
      _nameUz = nameUz;
    }
    if (nameEn != null) {
      _nameEn = nameEn;
    }
    if (nameRu != null) {
      _nameRu = nameRu;
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

  String? get id => _id;

  String? get nameUz => _nameUz;

  String? get nameEn => _nameEn;

  String? get nameRu => _nameRu;

  List<String>? get media => _media;

  String? get informUz => _informUz;

  String? get informEn => _informEn;

  String? get informRu => _informRu;

  String? get karta => _karta;

  String? get city => _city;

  String? get site => _site;

  List<String>? get tell => _tell;

  String? get date => _date;

  String? get categoryId => _categoryId;

  int? get reyting => _reyting;

  int? get users => _users;

  Hotel.fromJson(Map<String, dynamic> json) {
    _id = json['id'];
    _nameUz = json['name_uz'];
    _nameEn = json['name_en'];
    _nameRu = json['name_ru'];
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
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = _id;
    data['name_uz'] = _nameUz;
    data['name_en'] = _nameEn;
    data['name_ru'] = _nameRu;
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
