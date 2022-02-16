import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:http_parser/http_parser.dart';
import 'package:mime/mime.dart';
import 'package:mobileapp/core/components/exporting_packages.dart';
import 'package:mobileapp/services/auth_services.dart';
import 'package:http/http.dart' as http;
import 'package:mobileapp/services/image_pick_service.dart';

class OtherPage extends StatelessWidget {
  const OtherPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _imageShow(),
            ElevatedButton(
              onPressed: _onPressed,
              child: Text('Sent'),
            ),
          ],
        ),
      ),
    );
  }

  void _onPressed() async {
    Hotel hotel = Hotel(
        name: 'hotel test',
        city: 'tashkent',
        informEn: 'inform en',
        informUz: 'inform uz',
        informRu: 'inform ru',
        karta: 'http://dsafa',
        media: ['www'],
        tell: ['9999'],
        categoryId: '1991edea-7d4a-49fb-b627-79b777cf54ae');
    uploadImage(hotel);
  }

  Future<bool> uploadImage(Hotel hotel) async {
    // setState(() {
    //  // pr.show();
    // });

    final mimeTypeData =
        lookupMimeType(imageList[0].path, headerBytes: [0xFF, 0xD8])!
            .split('/');

    // Intilize the multipart request
    final imageUploadRequest = http.MultipartRequest('POST',
        Uri.parse('https://ucharteam-tourism.herokuapp.com/v1/api/hotel'));

    // Attach the file in the request
    final file = await http.MultipartFile.fromPath('media', imageList[0].path,
        contentType: MediaType(mimeTypeData[0], mimeTypeData[1]));

    imageUploadRequest.files.add(file);
    imageUploadRequest.fields['name'] = hotel.name;
    imageUploadRequest.fields['informUz'] = hotel.informUz;
    imageUploadRequest.fields['informEn'] = hotel.informEn;
    imageUploadRequest.fields['informRu'] = hotel.informRu;
    imageUploadRequest.fields['karta'] = hotel.karta;
    imageUploadRequest.fields['tell'] = hotel.tell.toString();
    imageUploadRequest.fields['tell'] = 455444.toString();
    imageUploadRequest.fields['city'] = hotel.city;
    imageUploadRequest.fields['category'] =
        'd11367cb-1e62-419d-b2a1-6a81732f457b';

    try {
      final streamedResponse = await imageUploadRequest.send();
      final response = await http.Response.fromStream(streamedResponse);
      print(response.statusCode);
      if (response.statusCode != 200) {
        return false;
      }
      final Map<String, dynamic> responseData = json.decode(response.body);
      // _resetState();
      print(responseData['message']);
      return true;
    } catch (e) {
      print(e);
      return false;
    }
  }

  Column _imageShow() {
    return Column(
      children: [
        IconButton(
            onPressed: () {
              choose();
            },
            icon: const Icon(Icons.add_a_photo)),
        if (imageList.isNotEmpty)
          SizedBox(
            width: 300,
            height: 100,
            child: Image.file(File(imageList[0].path), fit: BoxFit.cover),
          ),
      ],
    );
  }
}
