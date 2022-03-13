import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:mobileapp/core/components/exporting_packages.dart';

class GitService {
  static String baseUrl = 'https://ucharteam-tourism.herokuapp.com/v1/api';

  static Future createNewGit(Git git) async {
    try {
      String token = await GetStorage().read('token');
      print(token);
      var headers = {'token': token};
      var request = http.MultipartRequest('POST', Uri.parse('$baseUrl/git'));
      request.fields.addAll({
        'city': git.city.toString(),
        'informUz': git.informUz.toString(),
        'informRu': git.informRu.toString(),
        'informEn': git.informEn.toString(),
        'price': git.price.toString(),
      });

      // TELL LISTNI JO'NATISH
      for (var i in git.tell) {
        request.files.add(http.MultipartFile.fromString('tell', i));
      }

      // LANGUAGE LISTNI JO'NATISH
      for (var i in git.languages) {
        request.files.add(http.MultipartFile.fromString('languages', i));
      }

      //  RASMNI JO'NATISH
      final mimeTypeData =
          lookupMimeType(git.image, headerBytes: [0xFF, 0xD8])?.split('/');
      request.files.add(
        await http.MultipartFile.fromPath(
          'image',
          git.image,
          contentType: MediaType(mimeTypeData![0], mimeTypeData[1]),
          filename: git.image.split('/').last,
        ),
      );

      request.headers.addAll(headers);

      http.StreamedResponse response = await request.send();

      if (response.statusCode == 201) {
        print(await response.stream.bytesToString());
        var gitMap = jsonDecode(await response.stream.bytesToString());
        Git git = Git.fromJson(gitMap['data']);
        await GetStorage().write('git', git.toJson());
        return response.stream.bytesToString();
      } else {
        print('else error: ' + response.reasonPhrase.toString());
        print("else status code: " + response.statusCode.toString());
        response.stream.bytesToString().then((value) => print(value));
        return response.reasonPhrase;
      }
    } catch (e) {
      print('catch errorda: ' + e.toString());
      return e;
    }
  }

  static Future<List<Git>> fetchGitsByCity(String cityName) async {
    try {
      var response = await http
          .get(Uri.parse("$baseUrl/git"), headers: {"city": cityName});
      if (response.statusCode == 200) {
        List<Git> gitList = (jsonDecode(response.body)['data'] as List)
            .map((e) => Git.fromJson(e))
            .toList();
        print(gitList);
        return gitList;
      } else {
        return jsonDecode(response.body)['message'];
      }
    } catch (e) {
      List<Git> h = [];
      print('fetch git exception: $e');
      return h;
    }
  }

  static Future fetchGitComments({required String gitId}) async {
    try {
      var response = await http
          .get(Uri.parse("$baseUrl/comment"), headers: {"git_id": gitId});

      if (response.statusCode == 200) {
        print(response.body);
        return jsonDecode(response.body);
      } else {
        return jsonDecode(response.body);
      }
    } catch (e) {
      return e;
    }
  }

  Future addRatingToGit({required String gitId, required int rate}) async {
    String token = await GetStorage().read('token');
    //'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySWQiOiIyZmU4NDQ2Mi00ZjA5LTQ5NGUtYjRkZC1jZWVkMjRmZTI0MTciLCJpYXQiOjE2NDU3ODcxNjMsImV4cCI6MTY2MzA2NzE2M30.Qk-uLwwQ6OmvbPdzxpmNtmdBjYYvovNzwGXCs7LjXFM';

    try {
      var response = await http.post(
        Uri.parse('$baseUrl/reyting'),
        body: jsonEncode({"value": rate, "gitId": gitId}),
        headers: {'token': token, 'Content-Type': 'application/json'},
      );

      if (response.statusCode == 201) {
        print(jsonDecode(response.body));
        return jsonDecode(response.body);
      } else {
        print("else error: " +
            jsonDecode(response.body).toString() +
            response.statusCode.toString());
        return jsonDecode(response.statusCode.toString());
      }
    } catch (e) {
      print(e);
      return e;
    }
  }

  Future addCommentToGit(
      {required String gitId, required String commentText}) async {
    String token = GetStorage().read('token');
    //'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySWQiOiJmMzIyYjkxNi01MjQ0LTQ5YTItOWY0Ni1jM2E3YTYzNjA0Y2IiLCJpYXQiOjE2NDUwOTUwNzEsImV4cCI6MTY2MjM3NTA3MX0.cX0A_pOKUn7K6iekxocSWK4K5WrtHph_2-WrOXPDyis';

    try {
      var response = await http.post(
        Uri.parse('$baseUrl/comment'),
        body: jsonEncode({"name": commentText, "gitId": gitId}),
        headers: {'token': token, 'Content-Type': 'application/json'},
      );

      if (response.statusCode == 201 || response.statusCode == 200) {
        print(jsonDecode(response.body));
        return jsonDecode(response.body);
      } else {
        print(response.body);
        return jsonDecode(response.body);
      }
    } catch (e) {
      print(e);
      return e;
    }
  }

  static Future updateGitData(Git git) async {
    String token = await GetStorage().read('token');
    //'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySWQiOiI1ZGI4OGM0Yy04ODYxLTRjMTgtOWI3MS04MjZjM2M0NGFlYzEiLCJpYXQiOjE2NDYxNTI2MDcsImV4cCI6MTY2MzQzMjYwN30.WUaeEN7SJeYNC-8pZ-Vh4FcLu5fRAKLAUjFS3JZUUqg';
    try {
      var response = await http.put(
        Uri.parse('$baseUrl/git'),
        body: json.encode(
          {
            "informUz": git.informUz,
            "informEn": git.informEn,
            "informRu": git.informRu,
            "tell": git.tell,
            "city": git.city,
            "gitId": git.id,
            'languages': git.languages,
            'price': int.parse(git.price.toString())
          },
        ),
        headers: {'token': token, 'Content-Type': 'application/json'},
      );

      if (response.statusCode == 200) {
        print(response.body);
        return jsonDecode(response.body);
      } else {
        print(response.statusCode);
        return jsonDecode(response.statusCode.toString());
      }
    } catch (e) {
      print(e);
      return e;
    }
  }

  static Future updateGitImage(
      {required String gitId, required String gitImage}) async {
    try {
      String token = //await GetStorage().read('token');
          'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySWQiOiI1ZGI4OGM0Yy04ODYxLTRjMTgtOWI3MS04MjZjM2M0NGFlYzEiLCJpYXQiOjE2NDYxNTI2MDcsImV4cCI6MTY2MzQzMjYwN30.WUaeEN7SJeYNC-8pZ-Vh4FcLu5fRAKLAUjFS3JZUUqg';

      var headers = {'token': token};
      var request =
          http.MultipartRequest('PUT', Uri.parse('$baseUrl/git/$gitId'));

      final mimeTypeData =
          lookupMimeType(gitImage, headerBytes: [0xFF, 0xD8])?.split('/');
      //------------------
      request.files.add(await http.MultipartFile.fromPath(
        'image',
        gitImage,
        filename: gitImage.split('/').last,
        contentType: MediaType(mimeTypeData![0], mimeTypeData[1]),
      ));

      request.headers.addAll(headers);

      http.StreamedResponse response = await request.send();

      if (response.statusCode == 200) {
        print(await response.stream.bytesToString());
        return response.stream.bytesToString();
      } else {
        print('else error: ' + response.reasonPhrase.toString());
        return response.reasonPhrase;
      }
    } catch (e) {
      print('catch error: ' + e.toString());
      return null;
    }
  }

  Future deleteGit({required String gitId}) async {
    String token = await GetStorage().read('token');
    //'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySWQiOiJmMzIyYjkxNi01MjQ0LTQ5YTItOWY0Ni1jM2E3YTYzNjA0Y2IiLCJpYXQiOjE2NDUwOTUwNzEsImV4cCI6MTY2MjM3NTA3MX0.cX0A_pOKUn7K6iekxocSWK4K5WrtHph_2-WrOXPDyis';

    try {
      var response = await http.delete(
        Uri.parse("$baseUrl/git/$gitId"),
        headers: {'token': token},
      );

      if (response.statusCode == 201) {
        print(jsonDecode(response.body));
        return jsonDecode(response.body);
      } else {
        print(response.body);
        return jsonDecode(response.body);
      }
    } catch (e) {
      return e;
    }
  }
}
