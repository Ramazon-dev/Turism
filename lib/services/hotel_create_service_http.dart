import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:http_parser/http_parser.dart';
import 'package:mime/mime.dart';
import '../models/hotel_model.dart';

class HotelServiceHttp {
  

  // static Future<Map<String, dynamic>?> uploadImage(
  //     File image, Hotel hotel) async {
  //   String baseUrl = 'https://ucharteam-tourism.herokuapp.com/v1/api';
  //   String token =
  //       'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySWQiOiJmMzIyYjkxNi01MjQ0LTQ5YTItOWY0Ni1jM2E3YTYzNjA0Y2IiLCJpYXQiOjE2NDUwOTUwNzEsImV4cCI6MTY2MjM3NTA3MX0.cX0A_pOKUn7K6iekxocSWK4K5WrtHph_2-WrOXPDyis';
  //   final mimeTypeData =
  //       lookupMimeType(image.path, headerBytes: [0xFF, 0xD8])?.split('/');
  //   final imageUploadRequest =
  //       http.MultipartRequest('POST', Uri.parse("$baseUrl/hotel"));
  //   final file = await http.MultipartFile.fromPath('media', image.path,
  //       contentType: MediaType(mimeTypeData![0], mimeTypeData[1]));
  //   imageUploadRequest.files.add(file);
  //   imageUploadRequest.fields['name'] = hotel.name;
  //   imageUploadRequest.fields['city'] = hotel.city;
  //   imageUploadRequest.fields['karta'] = hotel.karta;
  //   imageUploadRequest.fields['unformUz'] = hotel.informUz;
  //   imageUploadRequest.fields['unformEn'] = hotel.informEn;
  //   imageUploadRequest.fields['unformRu'] = hotel.informRu;
  //   imageUploadRequest.fields['tell'] = hotel.tell[0];
  //   imageUploadRequest.fields['categoryId'] = hotel.categoryId;
  //   imageUploadRequest.headers.addAll({
  //     ""
  //         "Content-Type": "multipart/form-data",
  //     "token": token
  //   });
  //   try {
  //     final streamedResponse = await imageUploadRequest.send();
  //     final response = await http.Response.fromStream(streamedResponse);
  //     if (response.statusCode != 201) {
  //       print('create hotel servis try ichida null qaytdi, statuscode: ' + response.statusCode.toString());
  //       return null;
  //     }
  //     final Map<String, dynamic> responseData = json.decode(response.body);
  //     print("Hotel create servisda:" + responseData['message']);
  //     return responseData;
  //   } catch (e) {
  //     print(e);
  //     return null;
  //   }
  // }

}
