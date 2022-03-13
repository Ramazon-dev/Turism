// To parse this JSON data, do
//
//     final obekt = obektFromJson(jsonString);

import 'dart:convert';

Obekt obektFromJson(String str) => Obekt.fromJson(json.decode(str));

String obektToJson(Obekt data) => json.encode(data.toJson());

class Obekt {
  Obekt({
    this.id,
    this.nameUz,
    this.nameEn,
    this.nameRu,
    this.media,
    this.informUz,
    this.informEn,
    this.informRu,
    this.karta,
    this.city,
    this.site,
    this.tell,
    this.date,
    this.categoryId,
    this.reyting,
    this.users,
  });

  String? id;
  String? nameUz;
  String? nameEn;
  String? nameRu;
  List<String>? media;
  String? informUz;
  String? informEn;
  String? informRu;
  String? karta;
  String? city;
  String? site;
  String? tell;
  DateTime? date;
  String? categoryId;
  int? reyting;
  int? users;

  factory Obekt.fromJson(Map<String, dynamic> json) => Obekt(
        id: json["id"],
        nameUz: json["name_uz"],
        nameEn: json["name_en"],
        nameRu: json["name_ru"],
        media: List<String>.from(json["media"].map((x) => x)),
        informUz: json["inform_uz"],
        informEn: json["inform_en"],
        informRu: json["inform_ru"],
        karta: json["karta"],
        city: json["city"],
        site: json["site"],
        tell: json["tell"],
        date: DateTime.parse(json["date"]),
        categoryId: json["category_id"],
        reyting: json["reyting"],
        users: json["users"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name_uz": nameUz,
        "name_en": nameEn,
        "name_ru": nameRu,
        "media": List<dynamic>.from(media!.map((x) => x)),
        "inform_uz": informUz,
        "inform_en": informEn,
        "inform_ru": informRu,
        "karta": karta,
        "city": city,
        "site": site,
        "tell": tell,
        "date": date!.toIso8601String(),
        "category_id": categoryId,
        "reyting": reyting,
        "users": users,
      };
}
