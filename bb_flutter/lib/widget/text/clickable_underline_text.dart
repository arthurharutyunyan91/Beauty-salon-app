import 'package:flutter/material.dart';

class ClickableUnderlineTextWidget extends StatelessWidget {
  final String text;
  final Function onTap;
  final Color textColor;
  final double textSize;
  final double width;

  ClickableUnderlineTextWidget(
      {@required this.text,
        @required this.onTap,
        this.textColor = Colors.white70,
        this.textSize = 12,
        this.width = 120});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        color: Colors.transparent,
        width: width,
        height: textSize * 2.5,
        child: Center(
          child: Text(
            text,
            style: TextStyle(
                color: textColor,
                fontSize: textSize,
                decoration: TextDecoration.underline),
          ),
        ),
      ),
    );
  }
}