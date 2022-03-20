import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:mobileapp/models/comment.dart';

import '../core/components/exporting_packages.dart';

class CommentService {
  var request = http.Request('POST',
      Uri.parse('https://ucharteam-tourism.herokuapp.com/v1/api/comment'));

  Future<bool> addObjectComment({
    required String commentText,
    required String objectId,
  }) async {
    String token = await GetStorage().read('token');
    try {
      request.headers
          .addAll({'token': token, 'Content-Type': 'application/json'});
      request.body = json.encode({"name": commentText, "objectId": objectId});

      http.StreamedResponse response = await request.send();

      if (response.statusCode == 201) {
        return true;
      } else {
        print(response.reasonPhrase);
        return false;
      }
    } catch (e) {}
    return false;
  }

  static Future<List<Comment>?> getComment(Map<String, String> headers) async {
    var request = http.MultipartRequest('GET',
        Uri.parse('https://ucharteam-tourism.herokuapp.com/v1/api/comment'));
    request.fields.addAll({'hotel_id': ''});

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
