
import 'package:flutter/material.dart';
import 'package:flutter_app/resources/RColors.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class ProgressBar extends StatelessWidget {
  final show;

  ProgressBar({@required this.show, Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IgnorePointer(
      ignoring: !show,
      child: AnimatedOpacity(
        child: Container(
            color: RColors.blackTransparentOverlay,
          child: SpinKitCircle(color: Colors.white70)),
        opacity: show ? 1 : 0,
        duration: Duration(milliseconds: 500),
      ),
    );
  }
}
