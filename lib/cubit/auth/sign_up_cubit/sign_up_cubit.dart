import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:mobileapp/services/auth_services.dart';

part 'sign_up_state.dart';

class SignUpCubit extends Cubit<SignUpState> {
  SignUpCubit() : super(SignUpInitial());

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  bool _isAgree = false;

  void onPressed() {
    if (_formKey.currentState!.validate()) {
      // Button bosilganida shu funksiya ishga tushadi
      print('SignUpCubit.onPressed');
      String fullName = _nameController.text.trim();
      String email = _emailController.text.trim().toLowerCase();
      String password = _passwordController.text.trim();
      AuthServices.signUp(fullName, email, password).then((value) {
        if (value) {
          print(value);
        } else {
          print(value);
        }
      } );
    }
  }

  void onCheckBoxPressed(bool? value) {
    _isAgree = value!;
    emit(SignUpInitial());
  }

  GlobalKey<FormState> get formKey => _formKey;

  TextEditingController get emailController => _emailController;

  TextEditingController get passwordController => _passwordController;

  bool get isAgree => _isAgree;

  TextEditingController get nameController => _nameController;
}
