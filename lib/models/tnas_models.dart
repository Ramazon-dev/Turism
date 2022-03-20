// To parse this JSON data, do
//
//     final transportModelsssssss = transportModelsssssssFromJson(jsonString);

import 'dart:convert';

TransportModelsssssss transportModelsssssssFromJson(String str) => TransportModelsssssss.fromJson(json.decode(str));

String transportModelsssssssToJson(TransportModelsssssss data) => json.encode(data.toJson());

class TransportModelsssssss {
    TransportModelsssssss({
        this.message,
        this.data,
    });

    String? message;
    List<Datum>? data;

    factory TransportModelsssssss.fromJson(Map<String, dynamic> json) => TransportModelsssssss(
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
        this.owner,
        this.name,
        this.media,
        this.informUz,
        this.informEn,
        this.informRu,
        this.city,
        this.tell,
        this.price,
        this.date,
        this.categoryId,
        this.reyting,
        this.users,
    });

    String? id;
    String? owner;
    String? name;
    List<String>? media;
    String? informUz;
    String? informEn;
    String? informRu;
    String? city;
    List<String>? tell;
    String? price;
    DateTime? date;
    String? categoryId;
    double? reyting;
    int? users;

    factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        owner: json["owner"],
        name: json["name"],
        media: List<String>.from(json["media"].map((x) => x)),
        informUz: json["inform_uz"],
        informEn: json["inform_en"],
        informRu: json["inform_ru"],
        city: json["city"],
        tell: List<String>.from(json["tell"].map((x) => x)),
        price: json["price"],
        date: DateTime.parse(json["date"]),
        categoryId: json["category_id"],
        reyting: json["reyting"].toDouble(),
        users: json["users"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "owner": owner,
        "name": name,
        "media": List<dynamic>.from(media!.map((x) => x)),
        "inform_uz": informUz,
        "inform_en": informEn,
        "inform_ru": informRu,
        "city": city,
        "tell": List<dynamic>.from(tell!.map((x) => x)),
        "price": price,
        "date": date!.toIso8601String(),
        "category_id": categoryId,
        "reyting": reyting,
        "users": users,
    };
}
