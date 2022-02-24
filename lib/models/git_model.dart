

class Git {
    String? id;
    List<String> tell;
    String image;
    List<String> lenguages;
    String informUz;
    String informEn;
    String informRu;
    String price;
    String city;
    String? git;
    
    Git({
         this.id,
        required this.tell,
        required this.image,
        required this.lenguages,
        required this.informUz,
        required this.informEn,
        required this.informRu,
        required this.price,
        required this.city,
         this.git,
    });

    factory Git.fromJson(Map<String, dynamic> json) => Git(
        id: json["id"],
        tell: List<String>.from(json["tell"].map((x) => x)),
        image: json["image"],
        lenguages: List<String>.from(json["lenguages"].map((x) => x)),
        informUz: json["inform_uz"],
        informEn: json["inform_en"],
        informRu: json["inform_ru"],
        price: json["price"],
        city: json["city"],
        git: json["git"],
    );

    // Map<String, dynamic> toJson() => {
    //     "id": id,
    //     "tell": List<dynamic>.from(tell!.map((x) => x)),
    //     "image": image,
    //     "lenguages": List<dynamic>.from(lenguages!.map((x) => x)),
    //     "inform_uz": informUz,
    //     "inform_en": informEn,
    //     "inform_ru": informRu,
    //     "price": price,
    //     "city": city,
    //     "git": git,
    // };
}
