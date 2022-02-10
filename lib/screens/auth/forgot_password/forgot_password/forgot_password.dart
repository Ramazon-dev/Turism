import 'package:flutter/material.dart';
import 'package:mobileapp/core/components/exporting_packages.dart';
import 'package:mobileapp/core/components/size_config.dart';
import 'package:mobileapp/screens/auth/forgot_password/widgets/circular_icon.dart';
import 'package:mobileapp/screens/auth/forgot_password/widgets/text_widget.dart';
import 'package:mobileapp/widgets/appbar_origin.dart';
import 'package:mobileapp/widgets/elevated_button_widget.dart';

class ForgotPassword extends StatelessWidget {
  const ForgotPassword({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarOrigin(
        text: 'Забыл пароль? ',
        actions: const SizedBox(),
        actions2: const SizedBox(),
      ),
      body: SingleChildScrollView(
        child: Form(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  height: getHeight(40),
                ),
                const CircularIcon(),
                SizedBox(
                  height: getHeight(30),
                ),
                TextWidgetPassword(
                  text:
                      "Введите свой адрес электронной почты, чтобы получить код подтверждения.",
                ),
                SizedBox(
                  height: getHeight(30),
                ),
                TextFormFieldWidget(),
                SizedBox(
                  height: getHeight(150),
                ),
                ElevatedButtonWidget(
                  onPressed: () {},
                  label: 'Сохранить',
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
