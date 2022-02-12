import 'package:flutter_test/flutter_test.dart';
import 'package:mobileapp/services/comment_services.dart';

void main() async {
  test('object comment test', () async {
    var result = await CommentService().addObjectComment(
      commentText: 'commentText',
      objectId: "16cae6ad-cca5-4220-8ee5-b5bbdbdfe6da",
    );

    expect(result, true);
  });
}
