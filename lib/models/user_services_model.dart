import 'dart:convert';

import 'git_model.dart';
import 'hotel_model.dart';
import 'restaurant_model.dart';

UserServicesModel userServicesModelFromJson(String str) =>
    UserServicesModel.fromJson(json.decode(str));

String userServicesModelToJson(UserServicesModel data) =>
    json.encode(data.toJson());

class UserServicesModel {
  UserServicesModel({
    Git? git,
    List<Restaurant>? restaurants,
    List<Hotel>? hotels,
  }) {
    _git = git;
    _restaurants = restaurants;
    _hotels = hotels;
  }

  UserServicesModel.fromJson(dynamic json) {
    _git = json['git'] != null ? Git.fromJson(json['git']) : null;
    if (json['restaurants'] != null) {
      _restaurants = [];
      json['restaurants'].forEach((v) {
        _restaurants?.add(Restaurant.fromJson(v));
      });
    }
    if (json['hotels'] != null) {
      _hotels = [];
      json['hotels'].forEach((v) {
        _hotels?.add(Hotel.fromJson(v));
      });
    }
  }

  Git? _git;
  List<Restaurant>? _restaurants;
  List<Hotel>? _hotels;

  Git? get git => _git;

  List<Restaurant>? get restaurants => _restaurants;

  List<Hotel>? get hotels => _hotels;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_git != null) {
      map['git'] = _git?.toJson();
    }
    if (_restaurants != null) {
      map['restaurants'] = _restaurants?.map((v) => v.toJson()).toList();
    }
    if (_hotels != null) {
      map['hotels'] = _hotels?.map((v) => v.toJson()).toList();
    }
    return map;
  }
}
