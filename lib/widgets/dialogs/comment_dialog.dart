import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mobileapp/core/components/exporting_packages.dart';
import 'package:mobileapp/models/comment.dart';
import 'package:mobileapp/widgets/tiles/comment_tile.dart';

class CommentListDialog extends StatelessWidget {
  final Map<String, String> headers;
  const CommentListDialog({Key? key, required this.headers}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [

        FutureBuilder(
            future: CommentService.getComment(headers),
            builder: (ctx, AsyncSnapshot<List<Comment>?> snap) {
              if (snap.hasError) {
                return const Text('Error');
              } else if (snap.hasData) {
                if (snap.data!.isEmpty) {
                  return const EmptyPageWidget();
                }
                return Expanded(
                  child: ListView.builder(
                    padding: MyEdgeInsets.only(left: 20.0 ,right: 65.0, top: 22.0),
                    itemCount: snap.data!.length,
                    itemBuilder: (ctx, i) {
                      Comment comment = snap.data![i];
                      return CommentTile(comment: comment);
                    },
                  ),
                );
              }
              return const Center(child: CupertinoActivityIndicator());
            }),
      ],
    );
  }
}
