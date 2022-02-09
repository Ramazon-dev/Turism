import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mobileapp/services/auth_services.dart';

void main() async {

  test('Currency', () async {
    const String url = 'https://nbu.uz/en/exchange-rates/json/';
    Response res = await Dio().get(url);

  });

  try {
    test('Sign In', () async {
      const String url = 'https://ucharteam-tourism.herokuapp.com/v1/auth/login';
      Response res = await Dio().post(
        url,
        data: {
          "email": "bahromjon@gmail.com",
          "password" : "jkjkJ123s"
        },
      );
      print(res.data);
    });
  } catch(err) {
    print(err);
  }

  test('Sign Up', ()async{

    try {
      const String url = 'https://ucharteam-tourism.herokuapp.com/v1/auth/register';
      Response res = await Dio().post(
        url,
        data: {
          "email": "bahromjon.test@gmail.com",
          "password" : "Test12345ae",
          "fullName" : "BahromjonTest"
        },
      );
      print(res.data);
    }catch(err) {

    }

  });
}
