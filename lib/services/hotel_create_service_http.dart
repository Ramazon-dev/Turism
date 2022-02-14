// import 'package:dio/dio.dart';

// void _uploadFile(filePath1, filepath2) async {
//   // Get base file name
//   String fileName1 = basename(filePath1.path);
//   var ij = lookupMimeType(fileName1);
//   print('this is $ij');
//   print("File base name: $fileName1");
//   print(filePath1);
//   String fileName2 = basename(filepath2.path);

//   try {
//     FormData formData = new FormData.fromMap({
//       "text": 'hello',
//       "productImages": [
//         await MultipartFile.fromFile(filePath1.path, filename: fileName1),
//         await MultipartFile.fromFile(filepath2.path, filename: fileName2),
//       ]
//     });

//     Response response = await Dio().post(
//       "http://192.168.18.25:8080/test",
//       data: formData,
//     );
//     print("File upload response: $response");

//     // Show the incoming message in snakbar
//     _showSnakBarMsg(response.data['message']);
//   } catch (e) {
//     print("Exception Caught: $e");
//   }
// }
