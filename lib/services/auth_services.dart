import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:mobileapp/core/components/exporting_packages.dart';

class AuthServices {
  static Future<bool> signIn(String email, String password) async {
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
      if (response.statusCode == 200 || response.statusCode == 201) {
        // var data = await response.stream.bytesToString();
        var data = jsonDecode(await response.stream.bytesToString());
        String token = data['data']['token'];
        UserModel user = UserModel.fromJson(data['data']['user']);
        await GetStorage().write('token', token);
        await GetStorage().write('user', user.toMap());
        UserData.setCurrentUser = user;
        return true;
      } else {
        print(await response.stream.bytesToString());
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
        print(data);
        String token = data['data']['token'];
        UserModel user = UserModel.fromJson(data['data']['user']);
        await GetStorage().write('token', token);
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

  static fetchUserData() async {
    String baseUrl = 'https://ucharteam-tourism.herokuapp.com/v1';
    String userId = GetStorage().read('user')['id'];
    var headers = {'Content-Type': 'application/json'};
    var request = await http.get(Uri.parse('$baseUrl/api/user/$userId'),
        headers: headers);
  }
}
