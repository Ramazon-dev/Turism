import 'package:flutter/material.dart';
import 'package:mobileapp/core/components/exporting_packages.dart';
import 'package:mobileapp/core/data/image_list.dart';

class AddCommentLayout extends StatelessWidget {
  const AddCommentLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 73.h,
      child: Row(
        children: [
          CircleAvatar(
            radius: 22.w,
            backgroundColor: AppColors.linear,
            backgroundImage: const CachedNetworkImageProvider(
              ImageList.profileBlank,
            ),
          ),
          Expanded(
            child: TextFormField(
              controller: TextEditingController(),
              decoration: InputDecoration(
                hintText: 'Добавьте комментари...'
              ),
            ),
          ),

          IconButton(onPressed: (){}, icon: Icon(Icons.send))
        ],
      ),
    );
  }
}
