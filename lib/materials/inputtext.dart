import 'package:flutter/material.dart';

class InputTextField extends StatelessWidget {
  final TextEditingController controller;
  final TextInputType keyBoardType;
  final bool obscuretext;
  final FocusNode focusNode;
  final String hint;

  const InputTextField({
    Key? key,
    required this.controller,
    required this.keyBoardType,
    required this.hint,
    required this.focusNode,
    required this.obscuretext,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: obscuretext,
      focusNode: focusNode,
      controller: controller,
      keyboardType: keyBoardType,
      decoration: InputDecoration(hintText: hint),
    );
  }
}
