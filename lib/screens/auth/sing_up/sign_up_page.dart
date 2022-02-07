import 'package:flutter/material.dart';
import 'package:mobileapp/core/components/exporting_packages.dart';
import 'package:mobileapp/screens/auth/widgets/text_widget.dart';
import 'package:mobileapp/widgets/elevated_button_widget.dart';

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
          child: Form(
            key: formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AuthTextWidget(
                  text: 'Регистрация',
                ),
                Container(
                  margin: EdgeInsets.only(
                    top: getHeight(50),
                  ),
                  child: TextFormFieldWidget(
                    controller: namelController,
                    hint: 'Full name',
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(
                    top: getHeight(25),
                  ),
                  child: TextFormFieldWidget(
                    controller: emailController,
                    hint: 'Email',
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(
                    top: getHeight(25),
                  ),
                  child: TextFormFieldWidget(
                    controller: passwordController,
                    hint: 'Password',
                  ),
                ),
                SizedBox(height: getHeight(10)),
                CheckboxListTile(
                  value: check,
                  onChanged: (v) {
                    check = v!;
                  },
                  title: const Text(
                    "Я согласен с политикой конфиденциальности",
                  ),
                  controlAffinity: ListTileControlAffinity.leading,
                  // value: cubit.isTrue,
                  // onChanged: cubit.onChanged,
                ),
                SizedBox(height: getHeight(60)),
                InkWell(
                  onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ProfilePage(),
                    ),
                  ),
                  child: ElevatedButtonWidget(
                    text: 'Регистрация',
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: getHeight(30)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Text('У вас уже есть аккаунт?'),
                      const SizedBox(width: 15),
                      Container(
                        width: getWidth(100),
                        height: getHeight(45),
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: AppColors.blue,
                          ),
                          borderRadius: BorderRadius.circular(30),
                        ),
                        child: TextButton(
                          child: const Text(
                            "Войти",
                            style: TextStyle(color: AppColors.blue),
                          ),
                          onPressed: () {},
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
