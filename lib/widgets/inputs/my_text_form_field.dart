import 'package:flutter/material.dart';
import 'package:mobileapp/core/components/exporting_packages.dart';

// ignore: must_be_immutable
class TextFormFieldWidget extends StatelessWidget {
  TextEditingController? controller;
  bool autofocus;
  String? hint;
  TextInputAction action;
  TextInputType inputType;
  bool obscureText;
  FormFieldValidator<String>? validator;
  TextCapitalization capitalization;
  int lines;
  int? maxLength;
  Widget? prefix;

  TextFormFieldWidget({
    Key? key,
    this.autofocus = false,
    this.controller,
    this.hint,
    this.action = TextInputAction.next,
    this.inputType = TextInputType.text,
    this.obscureText = false,
    this.validator,
    this.maxLength,
    this.capitalization = TextCapitalization.none,
    this.lines = 1,
    this.prefix,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      autofocus: autofocus,
      controller: controller,
      textInputAction: action,
      keyboardType: inputType,
      obscureText: obscureText,
      validator: validator,
      maxLines: lines,
      maxLength: maxLength,
      textCapitalization: capitalization,
      style: _textStyle(AppColors.black),
      decoration: _buildInputDecoration(),
    );
  }

  InputDecoration _buildInputDecoration() {
    return InputDecoration(
        hintText: hint,
        counterStyle:const TextStyle(height: double.minPositive),
        counterText: '',
        hintStyle: _textStyle(AppColors.grey),
        prefixIcon: prefix,
        border: _outlineInputBorder(),
        enabledBorder: _outlineInputBorder(),
        focusedBorder: _outlineInputBorder(),
        contentPadding: EdgeInsets.all(getWidth(18.0)));
  }

  TextStyle _textStyle(Color color) {
    return TextStyle(fontSize: 16.sp, color: color);
  }

  OutlineInputBorder _outlineInputBorder() => OutlineInputBorder(
        borderSide: const BorderSide(color: AppColors.grey),
        borderRadius: BorderRadius.circular(10.r),
      );
}
