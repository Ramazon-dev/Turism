import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:http_parser/http_parser.dart';
import 'package:mime/mime.dart';
import 'package:mobileapp/core/components/exporting_packages.dart';
import 'package:mobileapp/services/image_pick_service.dart';
import 'package:mobileapp/widgets/cards/profile_info_card.dart';
import 'package:http/http.dart' as http;

class ProfileAuthPage extends StatefulWidget {
  const ProfileAuthPage({Key? key}) : super(key: key);

  @override
  State<ProfileAuthPage> createState() => _ProfileAuthPageState();
}

// TODO Vaqtincha StatefulWidget'da qilindi. Cubitga ulash kerak.
// todo bosin aka gazini men sizga iwonaman
// todo topinchi man kimman

class _ProfileAuthPageState extends State<ProfileAuthPage> {
  bool _isShow = false;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          ProfileAppBar(height: 274.0),
          _setTransform(child: const ProfileInfoCard()),
          _setTransform(
            x: 100.0,
            child: _buildTextButtonWidget(),
          ),
          _setTransform(child: _showChangingPasswordFields(), y: -90.0),
          _setTransform(child: _imageShow())
        ],
      ),
    );
  }

  Column _imageShow() {
    return Column(
      children: [
        IconButton(
            onPressed: () {
              choose();
            },
            icon: Icon(Icons.add_a_photo)),
        if (imageList.isNotEmpty)
          Container(
            width: 300,
            height: 100,
            child: Image.file(File(imageList[0].path)),
          )
      ],
    );
  }

  Visibility _buildTextButtonWidget() {
    return Visibility(
      visible: !_isShow,
      child: TextButtonWidget(
        onPressed: _onPressed,
        label: 'Изменить пароль?',
      ),
    );
  }

  Transform _setTransform(
          {double x = 0.0, double y = -140.0, required Widget child}) =>
      Transform.translate(
        offset: Offset(getWidth(x), getHeight(y)),
        child: child,
      );

  Visibility _showChangingPasswordFields() => Visibility(
        visible: _isShow,
        child: Padding(
          padding: MyEdgeInsets.symmetric(h: 30.0),
          child: MySizedBox(
            height: 322.0,
            child: Form(
              child: Column(
                children: [
                  TextFormFieldWidget(
                    hint: 'Первый пароль',
                  ),
                  MySizedBox(height: 20.0),
                  TextFormFieldWidget(
                    hint: 'Новый пароль',
                  ),
                  MySizedBox(height: 20.0),
                  TextFormFieldWidget(
                    hint: 'Повторите пароль',
                  ),
                  const Spacer(),
                  ElevatedButtonWidget(
                    onPressed: _onPressed,
                    label: 'Сохранить',
                  )
                ],
              ),
            ),
          ),
        ),
      );

  void _onPressed() {
    setState(() {
      _isShow = !_isShow;
    });
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
}
