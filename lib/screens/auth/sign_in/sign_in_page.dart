import 'package:flutter/material.dart';
import 'package:mobileapp/core/components/exporting_packages.dart';
import 'package:mobileapp/cubit/auth/sign_in_cubit/sign_in_cubit.dart';
import 'package:mobileapp/screens/auth/widget/text_widget.dart';

class SignInPage extends StatelessWidget {
  SignInPage({Key? key}) : super(key: key);
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  var formKey = GlobalKey<FormState>();
  bool check = false;
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return BlocProvider(
      create: (_) => SignInCubit(),
      child: BlocBuilder<SignInCubit, SignInState>(builder: (context, state) {
        SignInCubit cubit = context.watch();
        return Scaffold(
          body: SingleChildScrollView(
            child: Form(
              key: formKey,
              child: Column(
                children: [
                  Container(
                    margin: EdgeInsets.only(
                      top: getHeight(84),
                      left: getWidth(30),
                      right: getWidth(94),
                    ),
                    child: const AuthTextWidget(),
                  ),
                  Container(
                    margin: EdgeInsets.only(
                      top: getHeight(81),
                      left: getWidth(30),
                      right: getHeight(30),
                    ),
                    child: TextFormFieldWidget(
                      controller: emailController,
                      hint: 'Login',
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(
                      top: getHeight(25),
                      left: getWidth(30),
                      right: getHeight(30),
                    ),
                    child: TextFormFieldWidget(
                      controller: passwordController,
                      hint: 'Password',
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(
                      top: getHeight(16),
                      left: getWidth(30),
                    ),
                    child: CheckboxListTile(
                      value: cubit.isTrue,
                      onChanged: cubit.onChanged,
                      title: Text('data'),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      }),
    );
  }
}
