import 'dart:convert';

import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;
import 'package:mobileapp/models/obekt_model.dart';
import 'package:mobileapp/services/obekt_categoriya.dart';

class ObektSevices {
  static String baseUrl = 'https://ucharteam-tourism.herokuapp.com/v1/api';

  Future addCommentToObekt(
      {required String gitId, required String commentText}) async {
    String token = GetStorage().read('token');
    //'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySWQiOiJmMzIyYjkxNi01MjQ0LTQ5YTItOWY0Ni1jM2E3YTYzNjA0Y2IiLCJpYXQiOjE2NDUwOTUwNzEsImV4cCI6MTY2MjM3NTA3MX0.cX0A_pOKUn7K6iekxocSWK4K5WrtHph_2-WrOXPDyis';

    try {
      var response = await http.post(
        Uri.parse('$baseUrl/comment'),
        body: jsonEncode({"name": commentText, "objectId": gitId}),
        headers: {'token': token, 'Content-Type': 'application/json'},
      );

      if (response.statusCode == 201 || response.statusCode == 200) {
        print(jsonDecode(response.body));
        return jsonDecode(response.body);
      } else {
        print(response.body);
        return jsonDecode(response.body);
      }
    } catch (e) {
      print(e);
      return e;
    }
  }

  Future<List<Obekt>> fetchobektbyCity(
      String? cityName, String? category_id) async {
    try {
      var response = await http.get(Uri.parse("$baseUrl/object"),
          headers: {"city": cityName!, "category_id": category_id!});
      if (response.statusCode == 200) {
        print("${jsonDecode(response.body)['data']}_______________");
        List<Obekt> ObektList = (jsonDecode(response.body)['data'] as List)
            .map((e) => Obekt.fromJson(e))
            .toList();
        print("${ObektList}_______");
        return ObektList;
      } else {
        print(jsonDecode(response.body)['message']);
        return jsonDecode(response.body)['message'];
      }
    } catch (e) {
      List<Obekt> h = [];
      print('fetch Obekt exception: $e');
      return h;
    }
  }

  Future<List<ObektCategoriya>> obektkategoriya() async {
    try {
      var response = await http.get(Uri.parse("$baseUrl/objects/categories"));
      if (response.statusCode == 200) {
        print("${jsonDecode(response.body)['data']}");
        List<ObektCategoriya> ObektList =
            (jsonDecode(response.body)['data'] as List)
                .map((e) => ObektCategoriya.fromJson(e))
                .toList();
        print(ObektList);
        return ObektList;
      } else {
        return jsonDecode(response.body)['message'];
      }
    } catch (e) {
      List<ObektCategoriya> h = [];
      print('fetch Obekt exception: $e');
      return h;
    }
  }

  Future<List<Obekt>> fetchobektbyseason() async {
    try {
      var response = await http.get(Uri.parse("$baseUrl/object"));

      if (response.statusCode == 200) {
        print("${jsonDecode(response.body)['data']}");
        List<Obekt> ObektList = (jsonDecode(response.body)['data'] as List)
            .map((e) => Obekt.fromJson(e))
            .toList();
        print(ObektList);
        return ObektList;
      } else {
        return jsonDecode(response.body)['message'];
      }
    } catch (e) {
      List<Obekt> h = [];
      print('fetch Obekt exception: $e');
      return h;
    }
  }
}
