import 'package:mobileapp/models/user_model.dart';

class Git extends UserModel {
  int? _salary;
  List<String>? _lang;
  double? _rating;
  String? _about;

  Git(
    String fullName,
    String email,
    String password,
    String phone,
    int salary,
    List<String> lang,
    double rating,
    String about,
  ) : super(fullName, email, password, phone) {
    _salary = salary;
    _lang = lang;
    _rating = rating;
    _about = about;
  }

  Git.fromJson(Map<String, dynamic> json)
      : super(
          json['fullName'],
          json['email'],
          json['password'],
          json['phone'],
        ) {
    _about = json['about'];
    _lang = json['lang'];
    _rating = json['rating'];
    _salary = json['salary'];
  }

  String get about => _about;

  double get rating => _rating;

  List<String> get lang => _lang;

  int get salary => _salary;
}
