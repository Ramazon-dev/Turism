import 'package:flutter/material.dart';
import 'package:mobileapp/core/components/exporting_packages.dart';
import 'package:mobileapp/core/data/image_list.dart';

class AddCommentLayout extends StatelessWidget {
  final String type;
  final String id;

  const AddCommentLayout({
    Key? key,
    required this.type,
    required this.id,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: MyEdgeInsets.symmetric(v: 20.0, h: 15.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CircleAvatar(
            radius: 22.w,
            backgroundColor: AppColors.primary,
            backgroundImage: const CachedNetworkImageProvider(
              ImageList.profileBlank,
            ),
          ),
          Expanded(
            child: Padding(
              padding: MyEdgeInsets.symmetric(h: 20.0),
              child: TextFormField(
                maxLines: null,
                keyboardType: TextInputType.multiline,
                controller: TextEditingController(),
                decoration: InputDecoration(
                    constraints: BoxConstraints(maxHeight: 120.h),
                    contentPadding: MyEdgeInsets.symmetric(h: 12.0, v: 12.0),
                    hintText: 'Добавьте комментари...',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(32.0))),
              ),
            ),
          ),
          IconButton(
            onPressed: () async {
              CommentService.addObjectComment(
                  {'name': 'Comment Text here...', 'hotelId': id}).then((value) => print(value));
            },
            icon: const Icon(Icons.send, color: AppColors.blue),
            constraints: const BoxConstraints(),
          )
        ],
      ),
    );
  }
}
