class Git {
  late String image;
  late List<String> languages;
  late List<String> tell;
  String? id;
  String? username;
  String? informUz;
  String? informEn;
  String? informRu;
  String? city;
  String? price;
  String? date;
  int? reyting;
  int? users;

  Git(
      {this.id,
      this.username,
      required this.image,
      required this.languages,
      this.informUz,
      this.informEn,
      this.informRu,
      this.city,
      required this.tell,
      this.price,
      this.date,
      this.reyting,
      this.users});

  Git.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    username = json['username'];
    image = json['image'];
    languages = json['languages'].cast<String>();
    informUz = json['inform_uz'];
    informEn = json['inform_en'];
    informRu = json['inform_ru'];
    city = json['city'];
    tell = json['tell'].cast<String>();
    price = json['price'];
    date = json['date'];
    reyting = json['reyting'];
    users = json['users'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['username'] = username;
    data['image'] = image;
    data['languages'] = languages;
    data['inform_uz'] = informUz;
    data['inform_en'] = informEn;
    data['inform_ru'] = informRu;
    data['city'] = city;
    data['tell'] = tell;
    data['price'] = price;
    data['date'] = date;
    data['reyting'] = reyting;
    data['users'] = users;
    return data;
  }
}
