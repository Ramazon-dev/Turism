import 'package:dio/dio.dart' as dio;
import 'package:dio/dio.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mobileapp/models/hotel_model.dart';
import 'package:mobileapp/services/image_pick_service.dart';

class HotelDioService {
  Future<bool> createHotel(HotelModel hotel) async {
    //final XFile file = choose();

    var formData = FormData.fromMap({
      'name': hotel.name.toString(),
      'informUz': hotel.name.toString(),
      'informEn': hotel.name.toString(),
      'informRu': hotel.name.toString(),
      'karta': hotel.name.toString(),
      'city': hotel.name.toString(),
      'site': hotel.name.toString(),
      'tell': hotel.name.toString(),
      'category': 'd11367cb-1e62-419d-b2a1-6a81732f457b',
      // 'tell': '5555'
      // 'file':
      //     await MultipartFile.fromFile('./text.txt', filename: 'upload.txt'),
      'media': [
        imageList.map(
          (e) async => await MultipartFile.fromFile(e.path, filename: e.name),
        )
        //await MultipartFile.fromFile('./text2.txt', filename: 'text2.txt'),
      ]
    });
//var response = await Dio().post('/info', data: formData);

    try {
      String token = //await GetStorage().read('token');
          'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySWQiOiJjMzk5ZjdjNi04NDViLTQ3ZjItYTZkNS1lMWJjZDY0OTNjYTUiLCJpYXQiOjE2NDQzODE1NTgsImV4cCI6MTY2MTY2MTU1OH0.mRAiavg0cMQ05VHZH_5MR42q2m-cI1fHszCq-QUpdvo';

      var response = await Dio().post("ApiEndpoint/avatars",
          data: formData,
          options: dio.Options(headers: {
            "Content-Type": "multipart/form-data",
            "token": token
          }));
      if (response.statusCode == 200) {
        print(response.data);
        return true;
      }
    } on dio.DioError catch (e) {
      if (e.response != null) {
        print(e.response!.data);
        return false;
      }
    }
    return false;
  }
}
