import 'dart:convert';
import 'package:http/http.dart' as http;
import '../core/constants/variables.dart';

class GitService {
  Future fetchGitsByCity(String cityName) async {
    try {
      var response = await http
          .get(Uri.parse("$baseUrl/git"), headers: {"city": cityName});
      if (response.statusCode == 200) {
        return jsonDecode(response.body)['message'];
      } else {
        return jsonDecode(response.body)['message'];
      }
    } catch (e) {
      return e;
    }
  }

  Future<bool> addCommentToGit({
    required String commentText,
    required String gitId,
  }) async {
    String token = //await GetStorage().read('token');
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySWQiOiJjMzk5ZjdjNi04NDViLTQ3ZjItYTZkNS1lMWJjZDY0OTNjYTUiLCJpYXQiOjE2NDQzODE1NTgsImV4cCI6MTY2MTY2MTU1OH0.mRAiavg0cMQ05VHZH_5MR42q2m-cI1fHszCq-QUpdvo';
    try {
      var res = await http.post(Uri.parse("$baseUrl/comment"),
          headers: {'token': token, 'Content-Type': 'application/json'},
          body: jsonEncode({"name": commentText, "gitId": gitId}));

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

  Future<bool> addRatingToGit({
    required int value,
    required String gitId,
  }) async {
    String token = //await GetStorage().read('token');
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySWQiOiJjMzk5ZjdjNi04NDViLTQ3ZjItYTZkNS1lMWJjZDY0OTNjYTUiLCJpYXQiOjE2NDQzODE1NTgsImV4cCI6MTY2MTY2MTU1OH0.mRAiavg0cMQ05VHZH_5MR42q2m-cI1fHszCq-QUpdvo';
    try {
      var res = await http.post(Uri.parse("$baseUrl/reyting"),
          headers: {'token': token, 'Content-Type': 'application/json'},
          body: jsonEncode({"value": value, "gitId": gitId}));

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

  Future fetchCommentsOfGit(String gitId) async {
    try {
      var response = await http
          .get(Uri.parse("$baseUrl/comment"), headers: {"git_id": gitId});
      if (response.statusCode == 200) {
        return jsonDecode(response.body)['message'];
      } else {
        return jsonDecode(response.body)['message'];
      }
    } catch (e) {
      return e;
    }
  }

  Future deleteGit(String gitId) async {
    String token = //await GetStorage().read('token');
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySWQiOiJjMzk5ZjdjNi04NDViLTQ3ZjItYTZkNS1lMWJjZDY0OTNjYTUiLCJpYXQiOjE2NDQzODE1NTgsImV4cCI6MTY2MTY2MTU1OH0.mRAiavg0cMQ05VHZH_5MR42q2m-cI1fHszCq-QUpdvo';
    try {
      var response = await http
          .delete(Uri.parse("$baseUrl/git/$gitId"), headers: {"token": token});
      //(Uri.parse("$baseUrl/comment"), headers: {"hotel_id": gitId});
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
