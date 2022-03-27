import 'package:flutter/material.dart';
import 'package:mobileapp/core/components/exporting_packages.dart';
import 'package:mobileapp/core/components/image_filter.dart';
import 'package:mobileapp/widgets/buttons/language_button.dart';
import 'package:mobileapp/widgets/phone_list_widget.dart';
import 'package:mobileapp/widgets/top_bar/appbar_origin.dart';
import 'package:mobileapp/widgets/description_widjet.dart';

class GitDetailsForOwnerPage extends StatefulWidget {
  final Git git;

  const GitDetailsForOwnerPage({Key? key, required this.git}) : super(key: key);

  @override
  State<GitDetailsForOwnerPage> createState() => _GitDetailsForOwnerPageState();
}

class _GitDetailsForOwnerPageState extends State<GitDetailsForOwnerPage> {
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
                      widget.git.showInfo(context.locale.languageCode),
                      style: AppTextStyle.regular(),
                    ),
                    SizedBox(height: getHeight(16)),
                    PhoneListWidget(phoneList: widget.git.tell!.toList()),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        IconButton(
                          onPressed: () => CustomNavigator.push(
                            GitInfoPage(git: widget.git, isEditing: true
                                //hotel: Hotel.fromJson(git.toJson(),
                                ),
                          ),
                          icon: const Icon(
                            Icons.edit,
                          ),
                          color: Colors.green,
                        ),
                        IconButton(
                          onPressed: () {
                            showDialog(
                              context: context,
                              builder: (context) => AlertDialog(
                                title: const Text(
                                    "Chindan o'chirishni istaysizmi"),
                                actions: [
                                  TextButton(
                                    child: const Text("Yo'q"),
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                    },
                                  ),
                                  TextButton(
                                    child: const Text('Ha'),
                                    onPressed: () {
                                      GitService().deleteGit
                                          (gitId: widget.git.id!)
                                          .then((value) =>
                                              Navigator.pushAndRemoveUntil(
                                                  context,
                                                  MaterialPageRoute(
                                                      builder: (_) =>
                                                          const HomeScreen()),
                                                  (route) => false));
                                    },
                                  ),
                                ],
                              ),
                            );
                          },
                          icon: const Icon(
                            Icons.delete,
                            color: Colors.red,
                          ),
                        ),
                      ],
                    )
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
