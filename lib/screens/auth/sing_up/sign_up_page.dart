import 'package:flutter/material.dart';
import 'package:mobileapp/core/components/exporting_packages.dart';
import 'package:mobileapp/screens/auth/widgets/text_widget.dart';

class SignUpPage extends StatelessWidget {
  TextEditingController namelController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  var formKey = GlobalKey<FormState>();
  bool check = false;

  SignUpPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.white,
        title: const Text(
          'Назад',
          style: TextStyle(
            color: AppColors.black,
          ),
        ),
        elevation: 0,
        toolbarHeight: 70,
        iconTheme: const IconThemeData(color: AppColors.black),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(30.0),
          child: Column(
            children: [
              AuthTextWidget(
                text: 'Регистрация',
              ),
              Container(
                margin: EdgeInsets.only(
                  top: getHeight(81),
                  left: getWidth(30),
                  right: getHeight(30),
                ),
                child: TextFormFieldWidget(
                  controller: namelController,
                  hint: 'Full name',
                ),
              ),
              Container(
                margin: EdgeInsets.only(
                  top: getHeight(81),
                  left: getWidth(30),
                  right: getHeight(30),
                ),
                child: TextFormFieldWidget(
                  controller: emailController,
                  hint: 'Email',
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
