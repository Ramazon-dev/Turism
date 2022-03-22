import 'dart:convert';

Comment commentFromJson(String str) => Comment.fromJson(json.decode(str));

String commentToJson(Comment data) => json.encode(data.toJson());

class Comment {
  Comment({
    String? id,
    String? name,
    String? date,
    String? user,
    dynamic image,
  }) {
    _id = id;
    _name = name;
    _date = date;
    _user = user;
    _image = image;
  }

  Comment.fromJson(dynamic json) {
    _id = json['id'];
    _name = json['name'];
    _date = json['date'];
    _user = json['user'];
    _image = json['image'];
  }

  String? _id;
  String? _name;
  String? _date;
  String? _user;
  dynamic _image;

  String? get id => _id;

  String? get name => _name;

  String? get date => _date;

  String? get user => _user;

  dynamic get image => _image;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['name'] = _name;
    map['date'] = _date;
    map['user'] = _user;
    map['image'] = _image;
    return map;
  }
}
