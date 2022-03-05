import 'dart:convert';

import 'package:mobileapp/core/components/exporting_packages.dart';
import 'package:http/http.dart' as http;
import 'package:mobileapp/models/business_account_model.dart';

class BusinessAccountService {
  final String _token = GetStorage().read('token');
  final String _baseUrl = 'https://ucharteam-tourism.herokuapp.com/v1/api/user';
  Future getServiceList()async {
    Uri url = Uri.parse(_baseUrl);
    final Map<String, String> headers = {'token' : _token};
    var response = await http.get(url, headers: headers);
    var data = jsonDecode(response.body)['data'];
    BusinessAccountModel userServicesModel = BusinessAccountModel.fromJson(data);

  }
}