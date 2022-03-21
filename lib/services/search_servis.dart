import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;

class SearchServis {
  static String baseUrl = 'https://ucharteam-tourism.herokuapp.com/v1/api';

  getSearch() async {
    print("+++++++++++");

    var response = await http.get(
      Uri.parse("$baseUrl/search?name=al&role=hotel"),
    );

    print(response.body.toString());
    return "mana";
  }
}
