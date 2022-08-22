import 'package:flutter/material.dart';

getUnderlineDecoration(
    {@required String hintText,
    Widget prefixIcon,
    bool hasFocus,
    Widget suffixIcon}) {
  return InputDecoration(
    contentPadding: EdgeInsets.only(top: 16),
    hintText: hintText,
    hintStyle: TextStyle(color: Colors.white24),
    prefixIcon: prefixIcon,
    suffixIcon: suffixIcon,
    enabledBorder: new UnderlineInputBorder(
      borderSide: BorderSide(color: Colors.white24),
    ),
  );
}
