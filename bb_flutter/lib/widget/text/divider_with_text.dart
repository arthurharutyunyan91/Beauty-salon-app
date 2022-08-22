import 'package:flutter/material.dart';
import 'package:flutter_app/resources/RColors.dart';

class DividerWithText extends StatelessWidget {
  final double marginTop;
  final double marginBottom;
  final String text;
  final Color color;

  DividerWithText(
      {@required this.text,
      this.marginTop = 40,
      this.marginBottom = 10,
      this.color = RColors.dividerColor});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: marginTop, bottom: marginBottom, left: 8),
      child: Row(
        children: <Widget>[
          Text(
            text,
            style: TextStyle(
              color: color,
            ),
          ),
          Expanded(
              child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Divider(
              color: color,
            ),
          )),
        ],
      ),
    );
  }
}
