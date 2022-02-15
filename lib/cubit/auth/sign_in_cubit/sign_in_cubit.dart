import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:mobileapp/core/components/custom_navigator.dart';
import 'package:mobileapp/core/components/exporting_packages.dart';
import 'package:mobileapp/services/auth_services.dart';

part 'sign_in_state.dart';

class SignInCubit extends Cubit<SignInState> {
  SignInCubit() : super(SignInInitial());

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _loginController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  bool _isTrue = false;

  void onChanged(bool? v) {
    _isTrue = v!;
    emit(SignInInitial());
  }

  void onPressed() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      // Button bosilganida shu funksiya ishga tushadi
      String email = _loginController.text.trim();
      String password = _passwordController.text.trim();
      AuthServices.signIn(email, password).then((value) {
        if(value) {
          CustomNavigator().pushReplacement(const HomeScreen());
        } else {
          print(value);
        }
      });
    }
  }

  GlobalKey<FormState> get formKey => _formKey;

  TextEditingController get loginController => _loginController;

  TextEditingController get passwordController => _passwordController;

  bool get isTrue => _isTrue;
}
