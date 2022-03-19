class TransportModel {
  String? message;
  List<Data>? data;

  TransportModel({this.message, this.data});

  TransportModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
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
  String? date;
  String? categoryId;
  double? reyting;
  int? users;

  Data(
      {this.id,
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
      this.users});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    owner = json['owner'];
    name = json['name'];
    media = json['media'].cast<String>();
    informUz = json['inform_uz'];
    informEn = json['inform_en'];
    informRu = json['inform_ru'];
    city = json['city'];
    tell = json['tell'].cast<String>();
    price = json['price'];
    date = json['date'];
    categoryId = json['category_id'];
    reyting = json['reyting'];
    users = json['users'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['owner'] = this.owner;
    data['name'] = this.name;
    data['media'] = this.media;
    data['inform_uz'] = this.informUz;
    data['inform_en'] = this.informEn;
    data['inform_ru'] = this.informRu;
    data['city'] = this.city;
    data['tell'] = this.tell;
    data['price'] = this.price;
    data['date'] = this.date;
    data['category_id'] = this.categoryId;
    data['reyting'] = this.reyting;
    data['users'] = this.users;
    return data;
  }
}
