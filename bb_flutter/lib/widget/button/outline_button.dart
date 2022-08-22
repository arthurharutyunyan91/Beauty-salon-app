import 'package:flutter/material.dart';
import 'package:flutter_app/resources/RColors.dart';

class OutlineButtonWidget extends StatelessWidget {
  final Function onTap;
  final double widgetHeight;
  final Color color;
  final String text;
  final double textSize;
  final Color textColor;
  final bool fill;
  final double cornerRadius;

  OutlineButtonWidget(
      {@required this.onTap,
      @required this.text,
      this.widgetHeight = 50,
      this.color = RColors.primaryColor,
      this.textSize = 16,
      this.textColor = Colors.white70,
      this.fill = false,
      this.cornerRadius = 16});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: widgetHeight,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(cornerRadius),
            border: fill ? null : Border.all(color: color),
            color: fill ? color : null),
        child: Center(
          child: new Text(
            text,
            style: TextStyle(color: textColor, fontSize: textSize),
          ),
        ),
      ),
    );
  }
}
