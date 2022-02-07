import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;

class AuthServices {
  static Future<bool> signIn(String email, String password) async {
    String baseUrl = 'https://ucharteam-tourism.herokuapp.com/v1';

    print(baseUrl + '/auth/login');
    // print(await dotenv.env['BASE_URL'].toString() + '/v1/auth/login');
    try {
      Response res =
          await Dio().post(baseUrl.toString() + '/auth/login', data: {
        "email": 'umida@gmail.com',
        "password": "Umida7\$",
      });
      if (res.statusCode == 200) {
        print("TOKEN: ${res.data['data']['token']}");
        print("Fullname: ${res.data['data']['user']['fullname']}");
        //await GetStorage().write('token', res.data['jwt']);
        //await GetStorage().write('phone', res.data['user']['phone']);
        //await GetStorage().write('username', res.data['user']['username']);
        // await GetStorage().write('id', res.data['user']['id']);
        return true;
      } else {
        return false;
      }
    } catch (e) {
      print("SERVICE AUTH SIGN IN ERROR: $e");
    }
    return false;
  }

  static Future<bool> signUp(
    String fullName,
    String email,
    String password,
  ) async {
    String baseUrlTest = 'https://ucharteam-tourism.herokuapp.com/v1';
    // String baseUrl = dotenv.env['BASE_URL'].toString();

    //print(baseUrl + '/auth/login');
    print('$baseUrlTest/auth/register');
    Dio dio = Dio();
    dio.options.headers['content-Type'] = 'application/json';
    try {
      Response res = await dio.post(
        '$baseUrlTest/auth/register',
        data: {
          "fullName": "fulfdsdgdffdsflName test",
          "email": "tfdsfdgdsez@gmail.com",
          "password": "Teshfgf2@t.1234",
        },
        // options: Options(
        //   headers: {
        //     "Content-Type": "Application/json",
        //   },
        // )
      );
      if (res.statusCode == 201 || res.statusCode == 200) {
        // print("TOKEN: ${res.data['data']['token']}");
        // print("Fullname: ${res.data['data']['user']['fullname']}");
        //await GetStorage().write('token', res.data['jwt']);
        //await GetStorage().write('phone', res.data['user']['phone']);
        //await GetStorage().write('username', res.data['user']['username']);
        // await GetStorage().write('id', res.data['user']['id']);
        return true;
      } else {
        return false;
      }
    } catch (e) {
      print("SERVICE AUTH SIGN_UP ERROR: $e");
    }
    return false;
  }

  static Future<bool> signUpWithHttp(
    String fullName,
    String email,
    String password,
  ) async {
    String baseUrlTest = 'https://ucharteam-tourism.herokuapp.com/v1';
    // String baseUrl = dotenv.env['BASE_URL'].toString();

    //print(baseUrl + '/auth/login');
    print('$baseUrlTest/auth/register');

    try {
      var headers = {'Content-Type': 'application/json'};
      var request =
          http.Request('POST', Uri.parse('$baseUrlTest/v1/auth/register'));
      request.body = json.encode({
        "fullName": "Muslima Jamoliddinova",
        "email": "mua@gmail.com",
        "password": "Kamoliddsdsadin7"
      });
      request.headers.addAll(headers);

      http.StreamedResponse response = await request.send();

      if (response.statusCode == 200) {
        print(await response.stream.bytesToString());
        return true;
      } else {
        print(response.statusCode);
        return false;
      }
    } catch (e) {
      print("SERVICE AUTH SIGN_UP ERROR: $e");
    }
    return false;
  }
}
