// To parse this JSON data, do
//
//     final gitModel = gitModelFromJson(jsonString);

import 'dart:convert';

GitModel gitModelFromJson(String str) => GitModel.fromJson(json.decode(str));

String gitModelToJson(GitModel data) => json.encode(data.toJson());

class GitModel {
  GitModel({
    this.message,
    this.data,
  });

  String? message;
  List<Datum>? data;

  factory GitModel.fromJson(Map<String, dynamic> json) => GitModel(
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
    this.username,
    this.image,
    this.languages,
    this.informUz,
    this.informEn,
    this.informRu,
    this.city,
    this.tell,
    this.price,
    this.date,
    this.reyting,
    this.users,
  });

  String? id;
  String? username;
  String? image;
  List<String>? languages;
  String? informUz;
  String? informEn;
  String? informRu;
  String? city;
  List<String>? tell;
  String? price;
  DateTime? date;
  int? reyting;
  int? users;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        username: json["username"],
        image: json["image"],
        languages: List<String>.from(json["languages"].map((x) => x)),
        informUz: json["inform_uz"],
        informEn: json["inform_en"],
        informRu: json["inform_ru"],
        city: json["city"],
        tell: List<String>.from(json["tell"].map((x) => x)),
        price: json["price"],
        date: DateTime.parse(json["date"]),
        reyting: json["reyting"],
        users: json["users"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "username": username,
        "image": image,
        "languages": List<dynamic>.from(languages!.map((x) => x)),
        "inform_uz": informUz,
        "inform_en": informEn,
        "inform_ru": informRu,
        "city": city,
        "tell": List<dynamic>.from(tell!.map((x) => x)),
        "price": price,
        "date": date!.toIso8601String(),
        "reyting": reyting,
        "users": users,
      };
}
