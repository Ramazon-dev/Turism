import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:mobileapp/models/currency_model.dart';

class CurrencyService {
  static const String _apiLink = 'https://nbu.uz/en/exchange-rates/json/';

  static Future<List<CurrencyModel>> getCurrencyList() async {
    Uri url = Uri.parse(_apiLink);
    http.Response response = await http.get(url);
    List body = jsonDecode(response.body) as List;
    List<CurrencyModel> currencyList =
        body.map((e) => CurrencyModel.fromJson(e)).toList();
    return currencyList;
  }
}
