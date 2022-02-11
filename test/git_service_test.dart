import 'package:flutter_test/flutter_test.dart';
import 'package:mobileapp/services/git_service.dart';
import 'package:mobileapp/services/hotel_service.dart';

void main() async {
  test('fecht gits by city test', () async {
    var result = await GitService().fetchGitsByCity('toshkent');

    expect(result, 'OK');
  });

  test('add comment to git test', () async {
    var result = await GitService().addCommentToGit(
      commentText: "git comment",
      gitId: "8a130ae4-688d-41db-89f2-45c95bde3cb3",
    );

    expect(result, true);
  });

  test('add rating of git test', () async {
    var result = await GitService().addRatingToGit(
      value: 5,
      gitId: "8a130ae4-688d-41db-89f2-45c95bde3cb3",
    );
    expect(result, true);
  });

  test('fetch git comments test', () async {
    var result = await GitService()
        .fetchCommentsOfGit("8a130ae4-688d-41db-89f2-45c95bde3cb3");

    expect(result, 'OK');
  });

  test('delete git by id test', () async {
    var result =
        await GitService().deleteGit("8a130ae4-688d-41db-89f2-45c95bde3cb3");

    expect(result, 'NOT_DELETED!');
  });
}
