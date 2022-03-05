import 'package:flutter/material.dart';
import 'package:mobileapp/core/components/exporting_packages.dart';
import 'package:mobileapp/cubit/auth/sign_up_cubit/sign_up_cubit.dart';
import 'package:mobileapp/screens/auth/widgets/text_widget.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    CustomNavigator().init(context);
    return BlocProvider(
      create: (_) => SignUpCubit(),
      child: BlocBuilder<SignUpCubit, SignUpState>(
        builder: (ctx, state) {
          SignUpCubit cubit = ctx.watch();
          return Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.transparent,
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
                  key: cubit.formKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      AuthTextWidget(text: LocaleKeys.signUp.tr()),
                      MySizedBox(height: 41.0),
                      TextFormFieldWidget(
                        controller: cubit.nameController,
                        inputType: TextInputType.name,
                        capitalization: TextCapitalization.words,
                        hint: 'Full name',
                        validator: FormValidator.general,
                      ),
                      MySizedBox(height: 25.0),
                      TextFormFieldWidget(
                        controller: cubit.emailController,
                        hint: 'Email',
                        inputType: TextInputType.emailAddress,
                        validator: FormValidator.email,
                      ),
                      MySizedBox(height: 25.0),
                      TextFormFieldWidget(
                        controller: cubit.passwordController,
                        hint: LocaleKeys.password.tr(),
                        obscureText: true,
                        validator: FormValidator.password,
                        action: TextInputAction.done,
                      ),
                      MySizedBox(height: 10.0),
                      CheckboxListTile(
                        contentPadding: EdgeInsets.zero,
                        value: cubit.isAgree,
                        onChanged: cubit.onCheckBoxPressed,
                        title: Text(LocaleKeys.i_agree_pivacy.tr()),
                        controlAffinity: ListTileControlAffinity.leading,
                        // value: cubit.isTrue,
                        // onChanged: cubit.onChanged,
                      ),
                      SizedBox(height: getHeight(60)),
                      ElevatedButtonWidget(
                        onPressed: cubit.onPressed,
                        label: LocaleKeys.signUp.tr(),
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
                                child: Text(
                                  LocaleKeys.signIn.tr(),
                                  style: const TextStyle(color: AppColors.blue),
                                ),
                                onPressed: () {
                                  CustomNavigator.push(const SignInPage());
                                },
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
        },
      ),
    );
  }
}
