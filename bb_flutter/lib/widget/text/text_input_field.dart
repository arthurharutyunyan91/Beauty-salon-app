import 'package:flutter/material.dart';

import 'decoration.dart';

class TextInputField extends StatelessWidget {
  final String Function(String) validator;
  final String hint;
  final Widget prefixIcon;
  final Widget suffixIcon;
  final TextInputType inputType;
  final bool obscureText;
  final TextStyle style;
  final TextEditingController controller;

  TextInputField({
    this.validator,
    this.hint,
    this.prefixIcon,
    this.suffixIcon,
    this.inputType,
    this.obscureText = false,
    this.style,
    this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: inputType,
      obscureText: obscureText,
      validator: validator,
      style: style,
      decoration: getUnderlineDecoration(
        hintText: hint,
        prefixIcon: prefixIcon,
        suffixIcon: suffixIcon,
      ),
    );
  }
}
