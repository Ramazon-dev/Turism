import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:mobileapp/models/transport_model.dart';

class TransportService {
  static Future<List<TransportModel>?> getDataFromApi(String city) async {
    var headers = {'city': city};
    var request = http.Request('GET',
        Uri.parse('https://ucharteam-tourism.herokuapp.com/v1/api/transport'));

    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      var responseData = await response.stream.bytesToString();
      var data = (jsonDecode(responseData)['data'] as List);
      List<TransportModel> transportList = data.map((e) => TransportModel.fromJson(e)).toList();
      return transportList;
    } else {
      print(response.reasonPhrase);
    }
  }
}
