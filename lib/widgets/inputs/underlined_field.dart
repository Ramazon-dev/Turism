import 'package:flutter/material.dart';

class UnderlinedInputField extends StatelessWidget {
  final String hint;
  TextEditingController? controller;
  Widget? suffix;
  UnderlinedInputField({
    Key? key,
    required this.hint,
    this.controller,
    this.suffix,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        suffixIcon: suffix,
        border: _underlinedInputField(),
        hintText: hint,
      ),
    );
  }

  UnderlineInputBorder _underlinedInputField() => const UnderlineInputBorder();
}
