import 'package:flutter/material.dart';
import 'package:flutter_app/resources/RColors.dart';

class VerticalGradient extends StatelessWidget {
  final Color startColor;
  final Color endColor;
  final List<double> stops;

  VerticalGradient(
      {this.startColor = RColors.backgroundColor,
      this.endColor = Colors.transparent,
      this.stops});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: FractionalOffset.topCenter,
          end: FractionalOffset.center,
          colors: [
            startColor,
            endColor,
          ],
          stops: stops,
        ),
      ),
    );
  }
}
