import 'package:flutter/material.dart';
import 'package:flutter_app/resources/RColors.dart';

class CurvePathsWithText extends StatelessWidget {
  final double paddingTop;
  final bool fromLeft;
  final String text;

  CurvePathsWithText(
      {this.paddingTop = 160, this.fromLeft = true, this.text = ''});

  @override
  Widget build(BuildContext context) {
    final double widgetWidth = MediaQuery.of(context).size.width;
    final double widgetHeight = MediaQuery.of(context).size.height;
    final Size firstShapeSize = Size(widgetWidth * 0.65, widgetHeight * 0.1);
    final Size secondShapeSize = Size(widgetWidth * 0.77, widgetHeight * 0.18);
    final Size thirdShapeSize = Size(widgetWidth * 0.89, widgetHeight * 0.26);
    final Size fourthShapeSize = Size(widgetWidth, widgetHeight * 0.34);

    return Stack(
      children: <Widget>[
        Padding(
          padding: EdgeInsets.only(top: paddingTop - firstShapeSize.height / 2),
          child: Transform.translate(
            child: Container(
              width: firstShapeSize.width,
              height: firstShapeSize.height,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topLeft: fromLeft
                          ? Radius.elliptical(0, 0)
                          : Radius.elliptical(200, 200),
                      bottomLeft: fromLeft
                          ? Radius.elliptical(0, 0)
                          : Radius.elliptical(200, 200),
                      topRight: fromLeft
                          ? Radius.elliptical(200, 200)
                          : Radius.elliptical(0, 0),
                      bottomRight: fromLeft
                          ? Radius.elliptical(200, 200)
                          : Radius.elliptical(0, 0)),
                  border: Border.all(color: RColors.blackShape1, width: 1.5)),
              child: Align(
                alignment:
                    fromLeft ? Alignment.centerLeft : Alignment.centerRight,
                child: Padding(
                  padding: EdgeInsets.only(
                      right: fromLeft ? 0 : widgetWidth * 0.1,
                      left: fromLeft ? widgetWidth * 0.1 : 0),
                  child: Text(
                    text,
                    style: TextStyle(color: RColors.primaryColor, fontSize: 32),
                  ),
                ),
              ),
            ),
            offset: fromLeft
                ? Offset(-10, 0)
                : Offset(widgetWidth - firstShapeSize.width + 10, 0),
          ),
        ),
        Padding(
          padding:
              EdgeInsets.only(top: paddingTop - secondShapeSize.height / 2),
          child: Transform.translate(
            child: Container(
              width: secondShapeSize.width,
              height: secondShapeSize.height,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topLeft: fromLeft
                          ? Radius.elliptical(0, 0)
                          : Radius.elliptical(200, 200),
                      bottomLeft: fromLeft
                          ? Radius.elliptical(0, 0)
                          : Radius.elliptical(200, 200),
                      topRight: fromLeft
                          ? Radius.elliptical(200, 200)
                          : Radius.elliptical(0, 0),
                      bottomRight: fromLeft
                          ? Radius.elliptical(200, 200)
                          : Radius.elliptical(0, 0)),
                  border: Border.all(color: RColors.blackShape2, width: 1.5)),
            ),
            offset: fromLeft
                ? Offset(-10, 0)
                : Offset(widgetWidth - secondShapeSize.width + 10, 0),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(top: paddingTop - thirdShapeSize.height / 2),
          child: Transform.translate(
            child: Container(
              width: thirdShapeSize.width,
              height: thirdShapeSize.height,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topLeft: fromLeft
                          ? Radius.elliptical(0, 0)
                          : Radius.elliptical(200, 200),
                      bottomLeft: fromLeft
                          ? Radius.elliptical(0, 0)
                          : Radius.elliptical(200, 200),
                      topRight: fromLeft
                          ? Radius.elliptical(200, 200)
                          : Radius.elliptical(0, 0),
                      bottomRight: fromLeft
                          ? Radius.elliptical(200, 200)
                          : Radius.elliptical(0, 0)),
                  border: Border.all(color: RColors.blackShape3, width: 1.5)),
            ),
            offset: fromLeft
                ? Offset(-10, 0)
                : Offset(widgetWidth - thirdShapeSize.width + 10, 0),
          ),
        ),
        Padding(
          padding:
              EdgeInsets.only(top: paddingTop - fourthShapeSize.height / 2),
          child: Transform.translate(
            child: Container(
              width: fourthShapeSize.width,
              height: fourthShapeSize.height,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topLeft: fromLeft
                          ? Radius.elliptical(0, 0)
                          : Radius.elliptical(200, 200),
                      bottomLeft: fromLeft
                          ? Radius.elliptical(0, 0)
                          : Radius.elliptical(200, 200),
                      topRight: fromLeft
                          ? Radius.elliptical(200, 200)
                          : Radius.elliptical(0, 0),
                      bottomRight: fromLeft
                          ? Radius.elliptical(200, 200)
                          : Radius.elliptical(0, 0)),
                  border: Border.all(color: RColors.blackShape4, width: 1.5)),
            ),
            offset: fromLeft
                ? Offset(-10, 0)
                : Offset(widgetWidth - fourthShapeSize.width + 10, 0),
          ),
        ),
      ],
    );
  }
}
