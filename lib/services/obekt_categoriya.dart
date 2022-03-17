// To parse this JSON data, do
//
//     final obektCategoriya = obektCategoriyaFromJson(jsonString);

import 'dart:convert';

ObektCategoriya obektCategoriyaFromJson(String str) =>
    ObektCategoriya.fromJson(json.decode(str));

String obektCategoriyaToJson(ObektCategoriya data) =>
    json.encode(data.toJson());

class ObektCategoriya {
  ObektCategoriya({
    this.id,
    this.nameUz,
    this.nameEn,
    this.nameRu,
    this.date,
  });

  String? id;
  String? nameUz;
  String? nameEn;
  String? nameRu;
  DateTime? date;

  factory ObektCategoriya.fromJson(Map<String, dynamic> json) =>
      ObektCategoriya(
        id: json["id"],
        nameUz: json["name_uz"],
        nameEn: json["name_en"],
        nameRu: json["name_ru"],
        date: DateTime.parse(json["date"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name_uz": nameUz,
        "name_en": nameEn,
        "name_ru": nameRu,
        "date": date!.toIso8601String(),
      };
}
