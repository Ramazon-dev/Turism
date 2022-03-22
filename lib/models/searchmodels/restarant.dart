// To parse this JSON data, do
//
//     final reastarantModel = reastarantModelFromJson(jsonString);

import 'dart:convert';

ReastarantModel reastarantModelFromJson(String str) =>
    ReastarantModel.fromJson(json.decode(str));

String reastarantModelToJson(ReastarantModel data) =>
    json.encode(data.toJson());

class ReastarantModel {
  ReastarantModel({
    this.message,
    this.data,
  });

  String? message;
  List<Datum>? data;

  factory ReastarantModel.fromJson(Map<String, dynamic> json) =>
      ReastarantModel(
        message: json["message"],
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "message": message,
        "data": List<dynamic>.from(data!.map((x) => x.toJson())),
      };
}

class Datum {
  Datum({
    this.id,
    this.name,
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
  String? name;
  List<String>? media;
  String? informUz;
  String? informEn;
  String? informRu;
  String? karta;
  String? city;
  dynamic site;
  List<String>? tell;
  DateTime? date;
  String? categoryId;
  int? reyting;
  int? users;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        name: json["name"],
        media: List<String>.from(json["media"].map((x) => x)),
        informUz: json["inform_uz"],
        informEn: json["inform_en"],
        informRu: json["inform_ru"],
        karta: json["karta"],
        city: json["city"],
        site: json["site"],
        tell: List<String>.from(json["tell"].map((x) => x)),
        date: DateTime.parse(json["date"]),
        categoryId: json["category_id"],
        reyting: json["reyting"],
        users: json["users"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "media": List<dynamic>.from(media!.map((x) => x)),
        "inform_uz": informUz,
        "inform_en": informEn,
        "inform_ru": informRu,
        "karta": karta,
        "city": city,
        "site": site,
        "tell": List<dynamic>.from(tell!.map((x) => x)),
        "date": date!.toIso8601String(),
        "category_id": categoryId,
        "reyting": reyting,
        "users": users,
      };
}
