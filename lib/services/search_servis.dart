import 'dart:convert';

import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;
import 'package:mobileapp/core/components/exporting_packages.dart';
import 'package:mobileapp/models/business_account_model.dart';
import 'package:mobileapp/models/obekt_model.dart';
import 'package:mobileapp/models/searchmodels/restarant.dart';
import 'package:mobileapp/models/searchmodels/searchgit.dart';
import 'package:mobileapp/models/transport_model.dart';

class SearchServis {
  static String baseUrl = 'https://ucharteam-tourism.herokuapp.com/v1/api';

  Future getSearch(String name, String obekt) async {
    var response = await http.get(
      Uri.parse("$baseUrl/search?name=$name&role=$obekt"),
    );
    print(response.body.toString());
    switch (obekt) {
      case "restaurant":
        print("__________-");
        return ReastarantModel.fromJson(jsonDecode(response.body));
      case "transport":
        return TransportModel.fromJson(jsonDecode(response.body));
      case "object":
        return Obekt.fromJson(jsonDecode(response.body));
      case "hotel":
        return Hotel.fromJson(jsonDecode(response.body));
      case "git":
        return GitModel.fromJson(jsonDecode(response.body)).data;
      default:
        return [];
    }
  }
}
