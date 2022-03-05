import 'dart:convert';

class Restaurant {
  Restaurant({
    required this.name,
    required this.medias,
    required this.informUz,
    required this.informEn,
    required this.informRu,
    required this.karta,
    required this.city,
    required this.tell,
    required this.category,
    this.site,
    this.owner,
    this.id,
  });

  String? id;
  String name;
  List<String> medias;
  String informUz;
  String informEn;
  String informRu;
  String karta;
  String city;
  dynamic site;
  List<String> tell;
  String category;
  String? owner;

  factory Restaurant.fromMap(Map<String, dynamic> json) => Restaurant(
        id: json["id"],
        name: json["name"],
        medias: (json["medias"].map((x) => x)),
        informUz: json["inform_uz"],
        informEn: json["inform_en"],
        informRu: json["inform_ru"],
        karta: json["karta"],
        city: json["city"],
        site: json["site"],
        tell: List<String>.from(json["tell"].map((x) => x)),
        category: json["category"],
        owner: json["owner"],
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "name": name,
        "medias": List<dynamic>.from(medias.map((x) => x)),
        "inform_uz": informUz,
        "inform_en": informEn,
        "inform_ru": informRu,
        "karta": karta,
        "city": city,
        "site": site,
        "tell": List<dynamic>.from(tell.map((x) => x)),
        "category": category,
        "owner": owner,
      };
}
