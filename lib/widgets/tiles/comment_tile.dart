import 'package:flutter/material.dart';
import 'package:mobileapp/core/components/data_formatter.dart';
import 'package:mobileapp/core/components/exporting_packages.dart';
import 'package:mobileapp/core/data/image_list.dart';
import 'package:mobileapp/models/comment.dart';

class CommentTile extends StatelessWidget {
  final Comment comment;

  const CommentTile({Key? key, required this.comment}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: MyEdgeInsets.symmetric(v: 10.h),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CircleAvatar(
            backgroundColor: AppColors.lightGrey,
            backgroundImage: CachedNetworkImageProvider(
              DataFormatter.formatImageUrl(
                comment.image ?? ImageList.profileBlank,
              ),
            ),
          ),
          SizedBox(width: 10.w),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(comment.user!, style: AppTextStyle.regular(size: 10.0)),
              Text(comment.name!,
                  style:
                      AppTextStyle.regular(size: 10.0, color: AppColors.grey)),
            ],
          )
        ],
      ),
    );
  }
}
