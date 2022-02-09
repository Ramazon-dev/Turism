import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

part 'sign_up_state.dart';

class SignUpCubit extends Cubit<SignUpState> {
  SignUpCubit() : super(SignUpInitial());

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _loginController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  bool _isAgree = false;

  void onPressed() {
    if (_formKey.currentState!.validate() && _isAgree) {
      // Button bosilganida shu funksiya ishga tushadi
    }
  }

  void onCheckBoxPressed(bool? value) {
    _isAgree = value!;
    emit(SignUpInitial());
  }

  GlobalKey<FormState> get formKey => _formKey;

  TextEditingController get emailController => _loginController;

  TextEditingController get passwordController => _passwordController;

  bool get isAgree => _isAgree;

  TextEditingController get nameController => _nameController;
}
