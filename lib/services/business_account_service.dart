import 'dart:convert';

import 'package:mobileapp/core/components/exporting_packages.dart';
import 'package:http/http.dart' as http;
import 'package:mobileapp/models/business_account_model.dart';

class BusinessAccountService {
  static final String _token = GetStorage().read('token');
  static const String _baseUrl =
      'https://ucharteam-tourism.herokuapp.com/v1/api/user';

  static Future<BusinessAccountModel?> getServiceList() async {
    try {
      Uri url = Uri.parse(_baseUrl);
      print(_token);
      final Map<String, String> headers = {'token': _token};
      var response = await http.get(url, headers: headers);

      var data = jsonDecode(response.body)['data'];
      // print("DATA: "+ data);
      BusinessAccountModel businessAccountModel =
          BusinessAccountModel.fromJson(data);
      await GetStorage()
          .write('businessAccount', businessAccountModel.toJson());
      return businessAccountModel;
    } catch (err) {}
    return null;
  }

  static Future<BusinessAccountModel?> getServiceListFromStorage() async {
    var data = await GetStorage().read('businessAccount') ?? {};
    return BusinessAccountModel.fromJson(data);
  }

  static Future setIntoStorage() async {
    BusinessAccountModel? businessAccount = await getServiceList();
    await GetStorage().write('businessAccount', businessAccount!.toJson());
    if (businessAccount.git != null) {
      GetStorage().write('git', businessAccount.git!.toJson());
    }
  }
}
