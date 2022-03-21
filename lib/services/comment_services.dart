import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:mobileapp/models/comment.dart';

import '../core/components/exporting_packages.dart';

class CommentService {
 static var request = http.Request('POST',
      Uri.parse('https://ucharteam-tourism.herokuapp.com/v1/api/comment'));

  static Future<bool> addObjectComment({required String commentText, required String  typeId, required String type}) async {
    String token = await GetStorage().read('token');
    try {
      request.headers
          .addAll({'token': token, 'Content-Type': 'application/json'});
      request.body = json.encode({'name': commentText, type.replaceAll('_id', 'Id'): typeId});

      http.StreamedResponse response = await request.send();

      if (response.statusCode == 201) {
        return true;
      } else {
        print(response.reasonPhrase);
        return false;
      }
    } catch (e) {print(e);}
    print(false);
    return false;
  }

  static Future<List<Comment>?> getComment(Map<String, String> headers) async {
    var request = http.MultipartRequest('GET',
        Uri.parse('https://ucharteam-tourism.herokuapp.com/v1/api/comment'));
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      var data = await response.stream.bytesToString();
      return (jsonDecode(data)['data'] as List)
          .map((e) => Comment.fromJson(e))
          .toList();
    } else {
      print(response.reasonPhrase);
    }
    return null;
  }
}
