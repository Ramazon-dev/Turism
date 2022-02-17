// import 'dart:io';
// import 'package:http/http.dart' as http;
// import 'package:http_parser/http_parser.dart';
// import 'package:mime/mime.dart';

// class HotelServiceHttp{

//   Uri apiUrl = Uri.parse(
//       'http://cleanions.bestweb.my/api/Edit_user_details/edit_personal_info');

//   Future<Map<String, dynamic>> _uploadImage(File image) async {
//     // setState(() {
//     //   pr.show();
//     // });

//     final mimeTypeData =
//         lookupMimeType(image.path, headerBytes: [0xFF, 0xD8]).split('/');

//     // Intilize the multipart request
//     final imageUploadRequest = http.MultipartRequest('POST', apiUrl);

//     // Attach the file in the request
//     final file = await http.MultipartFile.fromPath(
//         'half_body_image', image.path,
//         contentType: MediaType(mimeTypeData[0], mimeTypeData[1]));
//     // Explicitly pass the extension of the image with request body
//     // Since image_picker has some bugs due which it mixes up
//     // image extension with file name like this filenamejpge
//     // Which creates some problem at the server side to manage
//     // or verify the file extension

// //    imageUploadRequest.fields['ext'] = mimeTypeData[1];

//     imageUploadRequest.files.add(file);
//     imageUploadRequest.fields['name'] = _name;
//     imageUploadRequest.fields['email'] = _email;
//     imageUploadRequest.fields['contact_no'] = _contact;

//     try {
//       final streamedResponse = await imageUploadRequest.send();
//       final response = await http.Response.fromStream(streamedResponse);
//       if (response.statusCode != 200) {
//         return null;
//       }
//       final Map<String, dynamic> responseData = json.decode(response.body);
//       _resetState();
//       return responseData;
//     } catch (e) {
//       print(e);
//       return null;
//     }
//   }

//   void _startUploading() async {
//     if (_image != null ||
//         _name != '' ||
//         _email != '' ||
//         _myCity != '' ||
//         gender != '' ||
//         _contact != '') {
//       final Map<String, dynamic> response = await _uploadImage(_image);

//       // Check if any error occured
//       if (response == null) {
//         pr.hide();
//         messageAllert('User details updated successfully', 'Success');
//       }
//     } else {
//       messageAllert('Please Select a profile photo', 'Profile Photo');
//     }
//   }F
// }