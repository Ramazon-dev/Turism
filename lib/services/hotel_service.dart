import 'dart:convert';

import 'package:http/http.dart' as http;

class HotelService {
  String baseUrl = 'https://ucharteam-tourism.herokuapp.com/v1/api';

  Future fetchHotelsByCity(String cityName) async {
    try {
      var response = await http
          .get(Uri.parse("$baseUrl/hotel"), headers: {"city": cityName});
      if (response.statusCode == 200) {
        return jsonDecode(response.body)['message'];
      } else {
        return jsonDecode(response.body)['message'];
      }
    } catch (e) {
      return e;
    }
  }

  Future fetchHotelsByCategory(String categryId) async {
    try {
      var response = await http.get(Uri.parse("$baseUrl/hotel"),
          headers: {"category_id": categryId});
      if (response.statusCode == 200) {
        return jsonDecode(response.body)['message'];
      } else {
        return jsonDecode(response.body)['message'];
      }
    } catch (e) {
      return e;
    }
  }

  Future fetchCategoriesOfHotel() async {
    try {
      var response = await http.get(
        Uri.parse("$baseUrl/hotels/categories"),
      );
      if (response.statusCode == 200) {
        return jsonDecode(response.body)['message'];
      } else {
        return jsonDecode(response.body)['message'];
      }
    } catch (e) {
      return e;
    }
  }

  Future<bool> addHotelComment({
    required String commentText,
    required String hotelId,
  }) async {
    String token = //await GetStorage().read('token');
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySWQiOiJjMzk5ZjdjNi04NDViLTQ3ZjItYTZkNS1lMWJjZDY0OTNjYTUiLCJpYXQiOjE2NDQzODE1NTgsImV4cCI6MTY2MTY2MTU1OH0.mRAiavg0cMQ05VHZH_5MR42q2m-cI1fHszCq-QUpdvo';
    try {
      var res = await http.post(Uri.parse("$baseUrl/comment"),
          headers: {'token': token, 'Content-Type': 'application/json'},
          body: jsonEncode({"name": commentText, "hotelId": hotelId}));

      if (res.statusCode == 201) {
        Map data = json.decode(res.body)['data'];
        print(data);
        return true;
      } else {
        print(jsonDecode(res.body)['message']);
        return false;
      }
    } catch (e) {
      print("GitComment Error: $e");
    }
    return false;
  }

  Future<bool> addHotelRating({
    required int value,
    required String hotelId,
  }) async {
    String token = //await GetStorage().read('token');
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySWQiOiJjMzk5ZjdjNi04NDViLTQ3ZjItYTZkNS1lMWJjZDY0OTNjYTUiLCJpYXQiOjE2NDQzODE1NTgsImV4cCI6MTY2MTY2MTU1OH0.mRAiavg0cMQ05VHZH_5MR42q2m-cI1fHszCq-QUpdvo';
    try {
      var res = await http.post(Uri.parse("$baseUrl/reyting"),
          headers: {'token': token, 'Content-Type': 'application/json'},
          body: jsonEncode({"value": value, "hotelId": hotelId}));

      if (res.statusCode == 201) {
        Map data = json.decode(res.body)['data'];
        print(data);
        return true;
      } else {
        print(jsonDecode(res.body)['message']);
        return false;
      }
    } catch (e) {
      print("GitComment Error: $e");
    }
    return false;
  }

  Future fetchCommentsOfHotel(String hotelId) async {
    try {
      var response = await http
          .get(Uri.parse("$baseUrl/comment"), headers: {"hotel_id": hotelId});
      if (response.statusCode == 200) {
        return jsonDecode(response.body)['message'];
      } else {
        return jsonDecode(response.body)['message'];
      }
    } catch (e) {
      return e;
    }
  }

  Future deleteHotel(String hotelId) async {
    String token = //await GetStorage().read('token');
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySWQiOiJjMzk5ZjdjNi04NDViLTQ3ZjItYTZkNS1lMWJjZDY0OTNjYTUiLCJpYXQiOjE2NDQzODE1NTgsImV4cCI6MTY2MTY2MTU1OH0.mRAiavg0cMQ05VHZH_5MR42q2m-cI1fHszCq-QUpdvo';
    try {
      var response = await http.delete(Uri.parse("$baseUrl/hotel/$hotelId"),
          headers: {"token": token});
      //(Uri.parse("$baseUrl/comment"), headers: {"hotel_id": hotelId});
      if (response.statusCode == 200) {
        return jsonDecode(response.body)['message'];
      } else {
        return jsonDecode(response.body)['message'];
      }
    } catch (e) {
      return e;
    }
  }
}
