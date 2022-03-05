class Category {
  late String id;
  late String nameUz;
  late String nameEn;
  late String nameRu;
  late String date;

  Category({
    required this.id,
    required this.nameUz,
    required this.nameEn,
    required this.nameRu,
    required this.date,
  });

  Category.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    nameUz = json['name_uz'];
    nameEn = json['name_en'];
    nameRu = json['name_ru'];
    date = json['date'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name_uz'] = nameUz;
    data['name_en'] = nameEn;
    data['name_ru'] = nameRu;
    data['date'] = date;
    return data;
  }
}
