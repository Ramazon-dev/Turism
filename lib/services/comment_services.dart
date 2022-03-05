import 'dart:convert';
import 'package:http/http.dart' as http;

class CommentService {
  var request = http.Request('POST',
      Uri.parse('https://ucharteam-tourism.herokuapp.com/v1/api/comment'));

  Future<bool> addObjectComment({
    required String commentText,
    required String objectId,
  }) async {
    String token = //await GetStorage().read('token');
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySWQiOiJjMzk5ZjdjNi04NDViLTQ3ZjItYTZkNS1lMWJjZDY0OTNjYTUiLCJpYXQiOjE2NDQzODE1NTgsImV4cCI6MTY2MTY2MTU1OH0.mRAiavg0cMQ05VHZH_5MR42q2m-cI1fHszCq-QUpdvo';
    try {
      request.headers
          .addAll({'token': token, 'Content-Type': 'application/json'});
      request.body = json.encode({"name": commentText, "objectId": objectId});

      http.StreamedResponse response = await request.send();

      if (response.statusCode == 201) {
        print(await response.stream.bytesToString());
        return true;
      } else {
        print(response.reasonPhrase);
        return false;
      }
    } catch (e) {
      print("ObjectComment Error: $e");
    }
    return false;
  }
}


