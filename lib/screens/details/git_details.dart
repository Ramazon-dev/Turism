import 'package:flutter/material.dart';
import 'package:mobileapp/core/components/exporting_packages.dart';
import 'package:mobileapp/core/components/image_filter.dart';
import 'package:mobileapp/widgets/buttons/language_button.dart';
import 'package:mobileapp/widgets/dialogs/comment_dialog.dart';
import 'package:mobileapp/widgets/phone_list_widget.dart';
import 'package:mobileapp/widgets/top_bar/appbar_origin.dart';
import 'package:mobileapp/widgets/description_widjet.dart';

class GitDetailsPage extends StatefulWidget {
  final Git git;

  const GitDetailsPage({Key? key, required this.git}) : super(key: key);

  @override
  State<GitDetailsPage> createState() => _GitDetailsPageState();
}

class _GitDetailsPageState extends State<GitDetailsPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      floatingActionButton: FloatingActionButton(
        backgroundColor: AppColors.black,
        child: SvgPicture.asset(AppIcons.comment),
        onPressed: () {
          _onButtonPressed(context);
        },
      ),
      appBar: AppBarOrigin(
        actions: SvgPicture.asset(AppIcons.language),
        actions2: SvgPicture.asset(AppIcons.dollar),
      ),
      body: Center(
        child: Container(
          margin: EdgeInsets.only(top: getHeight(10)),
          height: getHeight(592),
          width: getWidth(345),
          decoration: BoxDecoration(
            border: Border.all(color: AppColors.darkBorder, width: getWidth(1)),
            borderRadius: BorderRadius.all(
              Radius.circular(
                getWidth(7),
              ),
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: EdgeInsets.all(getWidth(11)),
                width: getWidth(323),
                height: getHeight(255),
                decoration: MyDecoration.netImage(
                    netImage: imageFilter(widget.git.image.toString())),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    DescriptionWidget(
                      name: widget.git.username.toString(),
                      price: widget.git.price.toString(),
                      rating: double.parse(widget.git.reyting.toString()),
                      users: 5,
                    ),

                    LanguageWidget(language: widget.git.languages!),

                    SizedBox(height: getHeight(28)),
                    Text(
                      "${widget.git.informEn}",
                      style: AppTextStyle.regular(),
                    ),
                    SizedBox(height: getHeight(16)),

                    PhoneListWidget(phoneList: widget.git.tell!.toList())
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _onButtonPressed(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (ctx) => CommentListDialog(
        headers: {'git_id': widget.git.id.toString()},
      ),
    );
  }
}
