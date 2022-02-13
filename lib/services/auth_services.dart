import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:http/http.dart' as http;
import 'package:mobileapp/core/components/exporting_packages.dart';
import 'package:mobileapp/models/user_model.dart';

class AuthServices {
  static Future<bool> signIn(String email, String password) async {
    String baseUrl = 'https://ucharteam-tourism.herokuapp.com/v1';
    try {
      Response res =
          await Dio().post(baseUrl.toString() + '/auth/login', data: {
        "email": email,
        "password": password,
      });
      if (res.statusCode == 200) {
        var data = res.data;
        UserModel user = UserModel.fromJson(data['data']['user']);
        await GetStorage().write('token', data['token']);
        await GetStorage().write('user', user.toMap());
        return true;
      } else {
        return false;
      }
    } catch (e) {
      print("SERVICE AUTH SIGN IN ERROR: $e");
    }
    return false;
  }

  static Future<bool> register({
    required String fullName,
    required String email,
    required String password,
  }) async {
    String baseUrlTest = 'https://ucharteam-tourism.herokuapp.com/v1';
    // String baseUrl = dotenv.env['BASE_URL'].toString();

    print('$baseUrlTest/auth/register');

    try {
      var headers = {'Content-Type': 'application/json'};
      var request =
          http.Request('POST', Uri.parse('$baseUrlTest/auth/register'));
      request.body = json.encode({
        "fullName": fullName,
        "email": email,
        "password": password,
      });
      request.headers.addAll(headers);

      http.StreamedResponse response = await request.send();

      if (response.statusCode == 200 || response.statusCode == 201) {
        var data = jsonDecode(await response.stream.bytesToString());
        UserModel user = UserModel.fromJson(data['data']['user']);
        await GetStorage().write('token', data['token']);
        await GetStorage().write('user', user.toMap());
        return true;
      } else {
        print(await response.stream.bytesToString());
        return false;
      }
    } catch (e) {
      print("SERVICE AUTH SIGN_UP ERROR: $e");
    }
    return false;
  }
}
