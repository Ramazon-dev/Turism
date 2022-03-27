import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:mobileapp/core/components/exporting_packages.dart';

class AuthServices {
  static Future? signIn(String email, String password) async {
    String baseUrl = 'https://ucharteam-tourism.herokuapp.com/v1';
    try {
      Uri url = Uri.parse('$baseUrl/auth/login');
      var headers = {'Content-Type': 'application/json'};
      var request = http.Request('POST', url);
      request.body = json.encode({
        "email": email,
        "password": password,
      });
      request.headers.addAll(headers);
      http.StreamedResponse response = await request.send();
      var res =  await http.Response.fromStream(response);

      
      if (res.statusCode == 200 || res.statusCode == 201) {
        var body = jsonDecode( res.body);
        String token = body['data']['token'];
        UserModel user = UserModel.fromJson(body['data']['user']);
        await GetStorage().write('token', token);
        await GetStorage().write('user', user.toMap());



        BusinessAccountService.setIntoStorage();

        UserData.setCurrentUser = user;
        return res.statusCode;
      } else {
        var result = jsonDecode(res.body);
        print( result);
        return result['message'].toString();
      }
    } catch (e) {
      print("SERVICE AUTH SIGN IN ERROR: $e");
      return e.toString();
    }
  }

  static Future<bool> register({
    required String fullName,
    required String email,
    required String password,
  }) async {
    String baseUrlTest = 'https://ucharteam-tourism.herokuapp.com/v1';

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
      var res = await http.Response.fromStream(response);

      if (res.statusCode == 200 || res.statusCode == 201) {
        var body = jsonDecode(res.body);
        print(body);
        String token = body['data']['token'];

        UserModel user = UserModel.fromJson(body['data']['user']);
        await GetStorage().write('token', token);
        await GetStorage().write('user', user.toMap());
        return true;
      } else {
        print( res.body);
        return false;
      }
    } catch (e) {
      print("SERVICE AUTH SIGN_UP ERROR: $e");
    }
    return false;
  }

  static fetchUserData() async {
    String baseUrl = 'https://ucharteam-tourism.herokuapp.com/v1';
    String userId = GetStorage().read('user')['id'];
    var headers = {'Content-Type': 'application/json'};
    var request = await http.get(Uri.parse('$baseUrl/api/user/$userId'),
        headers: headers);
  }

  static Future logout() async {
    await GetStorage().remove('token');
    await GetStorage().remove('user');
    await GetStorage().remove('businessAccount');
    await GetStorage().remove('git');
  }
}
