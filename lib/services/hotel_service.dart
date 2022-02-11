import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:mobileapp/core/components/exporting_packages.dart';

class HotelService {
  String baseUrl = 'https://ucharteam-tourism.herokuapp.com/v1/api';

  Future<List<Hotel>> fetchHotelsByCity(String cityName) async {
    try {
      var response = await http
          .get(Uri.parse("$baseUrl/hotel"), headers: {"city": cityName});
      if (response.statusCode == 200) {
        List<Hotel> hotelList = (jsonDecode(response.body)['data'] as List)
            .map((e) => Hotel.fromJson(e))
            .toList();
        return hotelList;
      } else {
        return jsonDecode(response.body)['message'];
      }
    } catch (e) {
      List<Hotel> h = [];
      return h;
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
}
