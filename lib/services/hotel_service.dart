import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';
import 'package:mobileapp/models/hotel_model.dart';
import 'package:mobileapp/services/image_pick_service.dart';

class HotelService {
  String baseUrl = 'https://ucharteam-tourism.herokuapp.com/v1/api';

  Future fetchHotelsByCity(String cityName) async {
    try {
      var response = await http
          .get(Uri.parse("$baseUrl/hotel"), headers: {"city": cityName});
      if (response.statusCode == 200) {
        return jsonDecode(response.body)['message'];
      } else {
        return jsonDecode(response.body)['message'];
      }
    } catch (e) {
      return e;
    }
  }

  Future fetchHotelsByCategory(String categryId) async {
    try {
      var response = await http.get(Uri.parse("$baseUrl/hotel"),
          headers: {"category_id": categryId});
      if (response.statusCode == 200) {
        return jsonDecode(response.body)['message'];
      } else {
        return jsonDecode(response.body)['message'];
      }
    } catch (e) {
      return e;
    }
  }

  Future fetchCategoriesOfHotel() async {
    try {
      var response = await http.get(
        Uri.parse("$baseUrl/hotels/categories"),
      );
      if (response.statusCode == 200) {
        return jsonDecode(response.body)['message'];
      } else {
        return jsonDecode(response.body)['message'];
      }
    } catch (e) {
      return e;
    }
  }

  Future<bool> addHotelComment({
    required String commentText,
    required String hotelId,
  }) async {
    String token = //await GetStorage().read('token');
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySWQiOiJjMzk5ZjdjNi04NDViLTQ3ZjItYTZkNS1lMWJjZDY0OTNjYTUiLCJpYXQiOjE2NDQzODE1NTgsImV4cCI6MTY2MTY2MTU1OH0.mRAiavg0cMQ05VHZH_5MR42q2m-cI1fHszCq-QUpdvo';
    try {
      var res = await http.post(Uri.parse("$baseUrl/comment"),
          headers: {'token': token, 'Content-Type': 'application/json'},
          body: jsonEncode({"name": commentText, "hotelId": hotelId}));

      if (res.statusCode == 201) {
        Map data = json.decode(res.body)['data'];
        print(data);
        return true;
      } else {
        print(jsonDecode(res.body)['message']);
        return false;
      }
    } catch (e) {
      print("GitComment Error: $e");
    }
    return false;
  }

  // upload(XFile imageFile) async {
  //     // open a bytestream
  //     var stream = http.ByteStream(DelegatingStream.typed(imageFile.openRead()));
  //     // get file length
  //     var length = await imageFile.length();

  //     // string to uri
  //     var uri = Uri.parse("http://ip:8082/composer/predict");

  //     // create multipart request
  //     var request =  http.MultipartRequest("POST", uri);

  //     // multipart that takes file
  //     var multipartFile =  http.MultipartFile('file', stream, length,
  //         filename: basename(imageFile.path));

  //     // add file to multipart
  //     request.files.add(multipartFile);

  //     // send
  //     var response = await request.send();
  //     print(response.statusCode);

  //     // listen for response
  //     response.stream.transform(utf8.decoder).listen((value) {
  //       print(value);
  //     });
  //   }

  Future<bool> createHotel(HotelModel hotel) async {
    String token = //await GetStorage().read('token');
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySWQiOiJjMzk5ZjdjNi04NDViLTQ3ZjItYTZkNS1lMWJjZDY0OTNjYTUiLCJpYXQiOjE2NDQzODE1NTgsImV4cCI6MTY2MTY2MTU1OH0.mRAiavg0cMQ05VHZH_5MR42q2m-cI1fHszCq-QUpdvo';

    try {
      var headers = {'token': token};
      var request = http.MultipartRequest('POST', Uri.parse('$baseUrl/hotel'));
      request.fields.addAll({
        'name': hotel.name.toString(),
        'informUz': hotel.name.toString(),
        'informEn': hotel.name.toString(),
        'informRu': hotel.name.toString(),
        'karta': hotel.name.toString(),
        'city': hotel.name.toString(),
        'site': hotel.name.toString(),
        'tell': hotel.name.toString(),
        'category': 'd11367cb-1e62-419d-b2a1-6a81732f457b',
        'tell': '5555'
      });
      // if (imageList.isNotEmpty) {
      //   for (var item in imageList) {
      //     request.files.add(
      //         await http.MultipartFile.fromPath('media', item.path.toString()));
      //   }
      // }

      request.files.add(await http.MultipartFile.fromPath('media',
          '/C:/Users/Zuhriddnin/Desktop/fc25d145eb2193df6950b34a8a9e9733.jpg'));
      request.headers.addAll(headers);

      http.StreamedResponse response = await request.send();

//*************************************************
      // var formData = FormData.fromMap({
      //   'name': hotel.name.toString(),
      //   'inform_uz': hotel.informUz.toString(),
      //   'inform_en': hotel.informEn.toString(),
      //   'inform_ru': hotel.informRu.toString(),
      //   'karta': hotel.karta.toString(),
      //   'site': hotel.site.toString(),
      //   'tell': hotel.tell,
      //   'category_id': hotel.categoryId.toString(),
      //   'files': [
      //     // rasmlani folderdan yozvoladigan funksiya bo'lish kerak avval
      //     await MultipartFile.fromFile('media', filename: 'text1.txt'),
      //     await MultipartFile.fromFile('./text2.txt', filename: 'text2.txt'),
      //   ]
      // });
      // var response = await Dio().post("$baseUrl/hotel", data: formData);

      // .then((response) {
      //   var jsonResponse = jsonDecode(response.data['message']);

      //  var averageGrindSize = jsonResponse['average_particle_size'];
      // }).catchError((error) => print(error));

      if (response.statusCode == 200) {
        print(await response.stream.bytesToString());
        return true;
      } else {
        print(response.reasonPhrase);
        return false;
      }
    } catch (e) {
      print(e);
      return false;
    }
  }

  Future<bool> addHotelRating({
    required int value,
    required String hotelId,
  }) async {
    String token = //await GetStorage().read('token');
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySWQiOiJjMzk5ZjdjNi04NDViLTQ3ZjItYTZkNS1lMWJjZDY0OTNjYTUiLCJpYXQiOjE2NDQzODE1NTgsImV4cCI6MTY2MTY2MTU1OH0.mRAiavg0cMQ05VHZH_5MR42q2m-cI1fHszCq-QUpdvo';
    try {
      var res = await http.post(Uri.parse("$baseUrl/reyting"),
          headers: {'token': token, 'Content-Type': 'application/json'},
          body: jsonEncode({"value": value, "hotelId": hotelId}));

      if (res.statusCode == 201) {
        Map data = json.decode(res.body)['data'];
        print(data);
        return true;
      } else {
        print(jsonDecode(res.body)['message']);
        return false;
      }
    } catch (e) {
      print("GitComment Error: $e");
    }
    return false;
  }

  Future fetchCommentsOfHotel(String hotelId) async {
    try {
      var response = await http
          .get(Uri.parse("$baseUrl/comment"), headers: {"hotel_id": hotelId});
      if (response.statusCode == 200) {
        return jsonDecode(response.body)['message'];
      } else {
        return jsonDecode(response.body)['message'];
      }
    } catch (e) {
      return e;
    }
  }

  Future deleteHotel(String hotelId) async {
    String token = //await GetStorage().read('token');
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySWQiOiJjMzk5ZjdjNi04NDViLTQ3ZjItYTZkNS1lMWJjZDY0OTNjYTUiLCJpYXQiOjE2NDQzODE1NTgsImV4cCI6MTY2MTY2MTU1OH0.mRAiavg0cMQ05VHZH_5MR42q2m-cI1fHszCq-QUpdvo';
    try {
      var response = await http.delete(Uri.parse("$baseUrl/hotel/$hotelId"),
          headers: {"token": token});
      //(Uri.parse("$baseUrl/comment"), headers: {"hotel_id": hotelId});
      if (response.statusCode == 200) {
        return jsonDecode(response.body)['message'];
      } else {
        return jsonDecode(response.body)['message'];
      }
    } catch (e) {
      return e;
    }
  }
}
