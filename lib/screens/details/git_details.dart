import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:mobileapp/core/components/exporting_packages.dart';
import 'package:mobileapp/services/obekt_services.dart';
import 'package:mobileapp/widgets/top_bar/appbar_origin.dart';
import 'package:mobileapp/widgets/description_widjet.dart';
import 'package:mobileapp/widgets/buttons/language_button.dart';
import 'package:http/http.dart' as http;

class GitDetailsPage extends StatefulWidget {
  final Git git;

  GitDetailsPage({Key? key, required this.git}) : super(key: key);

  @override
  State<GitDetailsPage> createState() => _GitDetailsPageState();
}

class _GitDetailsPageState extends State<GitDetailsPage> {
  TextEditingController _commentController = TextEditingController();

  List comment = [];

  bool isComment = false;

  @override
  Widget build(BuildContext context) {
    String baseUrl = 'https://ucharteam-tourism.herokuapp.com/v1/';
    String randImg = 'https://source.unsplash.com/random/4';

    return Scaffold(
      appBar: AppBarOrigin(
        actions: SvgPicture.asset(AppIcons.language),
        actions2: SvgPicture.asset(AppIcons.dollar),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: MediaQuery.of(context).size.height * 0.9,
              child: Center(
                child: Container(
                  margin: EdgeInsets.only(top: getHeight(20)),
                  height: getHeight(592),
                  width: getWidth(345),
                  decoration: BoxDecoration(
                    border: Border.all(
                        color: AppColors.darkBorder, width: getWidth(1)),
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
                        decoration: MyDecoration.netImage(netImage: randImg),
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
                              rating: double.parse(widget.git.price.toString()),
                              users: 5,
                            ),
                            LanguageWidget(language: widget.git.languages),
                            SizedBox(height: getHeight(28)),
                            Text(
                              "${widget.git.informEn}",
                              style: AppTextStyle.regular(),
                            ),
                            ContactWidget(
                              git: widget.git,
                              commentOpen: onCommentPressed,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            isComment ? commentfunc(context, sendMessage) : SizedBox()
          ],
        ),
      ),
    );
  }

  Column commentfunc(BuildContext context, VoidCallback funcComment) {
    return Column(
      children: [
        Container(
          alignment: Alignment.center,
          // color: Colors.red,
          height: getHeight(45),
          width: MediaQuery.of(context).size.width,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: getWidth(8)),
                child: SvgPicture.asset(AppIcons.commentperson),
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.72,
                child: TextFormFieldWidget(
                  controller: _commentController,
                ),
              ),
              InkWell(
                onTap: funcComment,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: getWidth(8)),
                  child: SvgPicture.asset(AppIcons.send),
                ),
              )
            ],
          ),
        ),
        Container(
          width: getWidth(288),
          padding: const EdgeInsets.all(8.0),
          height: getHeight(400),
          child: ListView.builder(
            reverse: true,
            itemBuilder: (context, i) {
              return Container(
                child: Row(
                  children: [
                    CircleAvatar(
                      child: Text(
                        comment[i]['user'][0],
                      ),
                    ),
                    SizedBox(
                      width: getWidth(10),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "${comment[i]['user']}",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        Text("${comment[i]['name']}"),
                      ],
                    ),
                  ],
                ),
              );
            },
            itemCount: comment.length,
          ),
        )
      ],
    );
  }

  sendMessage() async {
// print(${r.toString()});
    if (GetStorage().read('token') == null) {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => SignInPage()));
    } else {
      await GitService().addCommentToGit(
          gitId: widget.git.id.toString(),
          commentText: _commentController.text);
      onCommentPressed();
      setState(() {});
    }
  }

  void onCommentPressed() async {
    try {
      var headers = {
        // 'object_id':'${obekt.}'
        'git_id': '${widget.git.id}',
      };
      var request = http.Request('GET',
          Uri.parse('https://ucharteam-tourism.herokuapp.com/v1/api/comment'));
      request.body = '''''';
      request.headers.addAll(headers);

      http.StreamedResponse response = await request.send();

      if (response.statusCode == 200) {
        var res = await response.stream.bytesToString();
        comment = jsonDecode(res)['data'];
        isComment = true;
        setState(() {});
        print(comment.toString());
      } else {
        print(response.reasonPhrase);
      }
    } catch (e) {
      print(e.toString());
    }
  }
}
