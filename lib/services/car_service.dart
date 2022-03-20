import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:mobileapp/models/tnas_models.dart';
import 'package:mobileapp/models/transport_model.dart';

class CarsService {
  static String url =
      "https://ucharteam-tourism.herokuapp.com/v1/api/transport";

  static Future<List<TransportModel>> getCars() async {
    debugPrint("future ga kirdi malades");
    http.Response res = await http.get(
      Uri.parse(url),
      headers: {"city": "toshkent"},
    );
    debugPrint("future dan otti malades");

    if (res.statusCode == 200) {
      debugPrint('xozir if ichidamiza${res.body}');
      List<TransportModel> data = jsonDecode(res.body)['data'];

      debugPrint("aaaaaaaaaaaaaaaaaaaaaaaaaaajsondecode dan otti \n $data");
      List<TransportModel> body = jsonDecode(res.body)['data'];
      return body;
    } else {
      debugPrint("else ga kirdi va shuni qaytardi ${res.body},,,");
      throw Exception("xato ketti ujes");
    }
  }
}

class TransportServisec {
  static Future<TransportModelsssssss> getDataFromApi() async {
    var response = await http.get(
      Uri.parse('https://ucharteam-tourism.herokuapp.com/v1/api/transport'),
      headers: {"city": "toshkent"},
    );

    if (response.statusCode == 200 || response.statusCode == 201) {
      var data = jsonDecode(response.body);
      debugPrint("service dan malumot lekishi $data");
      TransportModelsssssss model = TransportModelsssssss.fromJson(data);

      return model;
    } else {
      throw "ERROR";
    }
  }
}
