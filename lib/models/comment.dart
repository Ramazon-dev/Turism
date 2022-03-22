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
    String? userId,
  }) {
    _id = id;
    _name = name;
    _date = date;
    _user = user;
    _image = image;
    _userId = userId;
  }

  Comment.fromJson(dynamic json) {
    _id = json['id'];
    _userId = json['user_id'];
    _name = json['name'];
    _date = json['date'];
    _user = json['user'];
    _image = json['image'];
  }

  String? _id;
  String? _userId;
  String? _name;
  String? _date;
  String? _user;
  dynamic _image;

  String? get id => _id;

  String? get name => _name;

  String? get date => _date;

  String? get user => _user;

  dynamic get image => _image;

  String? get userId => _userId;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['name'] = _name;
    map['date'] = _date;
    map['user'] = _user;
    map['image'] = _image;
    map['user_id'] = _userId;
    return map;
  }
}
