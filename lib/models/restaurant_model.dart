class Restaurant {
  late String name;
  late String informUz;
  late String informEn;
  late String informRu;
  late String karta;
  late String category;
  late String city;
  late List<String> media;
  late List<String> tell;
  String? date;
  String? site;
  int? reyting;
  int? users;
  String? id;

  Restaurant({
    required this.name,
    required this.media,
    required this.informUz,
    required this.informEn,
    required this.informRu,
    required this.karta,
    required this.city,
    required this.tell,
    required this.category,
    this.site,
    this.id,
    this.date,
    this.reyting,
    this.users,
  });

  Restaurant.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    media = json['media'];
    informUz = json['inform_uz'];
    informEn = json['inform_en'];
    informRu = json['inform_ru'];
    karta = json['karta'];
    city = json['city'];
    site = json['site'];
    tell = json['tell'];
    date = json['date'];
    category = json['category_id'];
    reyting = json['reyting'];
    users = json['users'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['media'] = media;
    data['inform_uz'] = informUz;
    data['inform_en'] = informEn;
    data['inform_ru'] = informRu;
    data['karta'] = karta;
    data['city'] = city;
    data['site'] = site;
    data['tell'] = tell;
    data['date'] = date;
    data['category_id'] = category;
    data['reyting'] = reyting;
    data['users'] = users;
    return data;
  }
}
