import 'package:flutter/material.dart';
import 'package:mobileapp/core/components/exporting_packages.dart';
import 'package:mobileapp/core/data/image_list.dart';

// ignore: must_be_immutable
class AddCommentLayout extends StatefulWidget {
  late String type;
  late String id;

  AddCommentLayout({
    Key? key,
    required this.type,
    required this.id,
  }) : super(key: key);

  @override
  State<AddCommentLayout> createState() => _AddCommentLayoutState();
}

class _AddCommentLayoutState extends State<AddCommentLayout> {
  final TextEditingController _commentController = TextEditingController();

  bool hasSent = true;

  final String _token = GetStorage().read('token') ?? '';

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: MyEdgeInsets.symmetric(v: 20.0, h: 15.0),
      child: _token.isEmpty
          ? _goToRegister()
          : Row(
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
                      controller: _commentController,
                      decoration: InputDecoration(
                        constraints: BoxConstraints(maxHeight: 120.h),
                        contentPadding:
                            MyEdgeInsets.symmetric(h: 12.0, v: 12.0),
                        hintText: 'Добавьте комментари...',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(32.0),
                        ),
                      ),
                    ),
                  ),
                ),
                IconButton(
                  onPressed: _onSendButtonPressed,
                  icon: hasSent
                      ? const Icon(Icons.send, color: AppColors.blue)
                      : const CircularProgressIndicator(),
                  constraints: const BoxConstraints(),
                )
              ],
            ),
    );
  }

  void _onSendButtonPressed() async {
    String comment = _commentController.text.trim();
    setState(
      () => hasSent = false,
    );
    if (comment.isNotEmpty) {
      CommentService.addObjectComment(
              commentText: comment, type: widget.type, typeId: widget.id)
          .then((value) => setState(() => hasSent = value));
      _commentController.clear();
    } else {
      return;
    }
  }

  Widget _goToRegister() => SizedBox(
        height: 48.h,
        child: Text(
          'To comment you must register',
          style: AppTextStyle.semiBold(),
        ),
      ).onClick(() {
        CustomNavigator.push(const SignInPage());
  });
}
