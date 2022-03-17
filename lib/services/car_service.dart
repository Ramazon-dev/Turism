import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

class CarsService {
  static String url =
      "https://ucharteam-tourism.herokuapp.com/v1/api/transport";

  static Future getCars() async {
    debugPrint("future ga kirdi malades");
    http.Response res = await http.get(
      Uri.parse(url),
      headers: {"city": "toshkent"},
    );
    debugPrint("future dan otti malades");

    if (res.statusCode == 200) {
      debugPrint("if ga kirdi va shuni qaytardi ${res.body}");

      return res.body;
    } else {
      debugPrint("else ga kirdi va shuni qaytardi ${res.body},,,");
      throw Exception("xato ketti ujes");
    }
  }
}
